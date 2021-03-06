class ChargesController < ApplicationController
	before_action :set_order, only: [:new, :create]
  # Possible to refresh confirmation page and resend emails; need a better solution
  # after_action :fill_order, only: [:create]

  def new
  end

	def create
    unless @order.status == 'complete'
      begin
        if @order.is_global_giving?
          if @order.registry.projects.count > 1
            if eval(@order.summary).keys.length > 1
              raise "We're having trouble fulfilling your order. Please contact kate@heartful.ly for assistance."
              process_multiple_global_giving_orders
              @order.update(status: 'complete')
              fill_order
            else
              project_id = eval(@order.summary).keys.first
              gg_order = process_global_giving_order(Project.find(project_id).source_id)
              if gg_order["donation"]
                @order.update(receipt_number: gg_order["donation"]["receipt"]["receiptNumber"], status: 'complete')
                fill_order
              end
            end
            render :create_holiday
          else
            gg_order = process_global_giving_order(@order.registry.projects.first.source_id)
            if gg_order["donation"]
              @order.update(receipt_number: gg_order["donation"]["receipt"]["receiptNumber"], status: 'complete')
              fill_order
              if @order.registry.url_slug == "valentinesday"
                render :create_valentine
              elsif @order.registry.url_slug == "mothersday"
                render :create_mothersday
              else
                render :create_global_giving
              end
            end
          end
        else
          customer = Stripe::Customer.create(
            email: @order.email,
            card: params[:stripe],
            metadata: {
              project_name: @order.registry.projects.first.name,
              registry: @order.registry.name,
              price: @order.total
            }
          )

          charge = Stripe::Charge.create(
            customer: customer.id,
            amount: @order.total.tr('$,.', '').to_i,
            currency: 'usd',
            metadata: {
              project_name: @order.registry.projects.first.name,
              registry: @order.registry.name,
              price: @order.total
            },
            receipt_email: @order.email,
            description: "A charge from Heartful.ly"
          )

          @order.complete if charge
          fill_order

          if @order.registry.url_slug == 'sharethelove'
            render :create_valentine
          end

          if @order.registry.type && @order.registry.type.downcase == 'campaign'
            render :create_campaign
          end
        end
      rescue Stripe::CardError => e
        @order.update_attributes(status: "error")
        body = e.json_body
        err  = body[:error]
        logger.info "Status is: #{e.http_status}"
        logger.info "Type is: #{err[:type]}"
        logger.info "Code is: #{err[:code]}"
        logger.info "Param is: #{err[:param]}"
        logger.info "Message is: #{err[:message]}"
        flash[:error] = err[:message]
        render 'new'
      rescue Exception => e
        @order.update_attributes(status: "error")
        logger.info "Order #{@order.id} had an error: #{e.backtrace}"
        flash[:error] = e.message
        render 'new'
      end
    end
  end

  private

  def process_global_giving_order(source_id)
    conn = Faraday.new('https://api.globalgiving.org') do |conn|
      conn.request :url_encoded
      conn.adapter Faraday.default_adapter
    end

    access_token = get_access_token(conn)

    query_params = "api_key=#{ENV['GLOBAL_GIVING_API_KEY']}&api_token=#{access_token}"
    donation_url = "api/secure/givingservice/donationsclient?#{query_params}"

    donation_params = gg_order_params_with_cc(source_id).to_json

    order_confirmation_response = conn.post do |req|
      req.url donation_url
      req.headers['Accept'] = 'application/json'
      req.headers['Content-Type'] = 'application/json'
      req.body = donation_params
    end

    if order_confirmation_response.status == 200
      return JSON.parse(order_confirmation_response.body)
    else
      logger.info "Order #{@order.id} has failed: #{order_confirmation_response.body}"
      raise "#{JSON.parse(order_confirmation_response.body)["error_response"]["errors"]["error"].first["error_message"]}"
    end
  end

  def process_multiple_global_giving_orders
    conn = Faraday.new('https://api.globalgiving.org') do |conn|
      conn.request :url_encoded
      conn.adapter Faraday.default_adapter
    end

    access_token = get_access_token(conn)

    query_params="api_key=#{ENV['GLOBAL_GIVING_API_KEY']}&api_token=#{access_token}"
    donation_url = "api/secure/givingservice/giftcertificates?#{query_params}"

    donation_params = gg_gift_cert_params.to_json

    order_confirmation_response = conn.post do |req|
      req.url donation_url
      req.headers['Accept'] = 'application/json'
      req.headers['Content-Type'] = 'application/json'
      req.body = donation_params
    end

    if order_confirmation_response.status == 200
      resp = JSON.parse(order_confirmation_response.body)
      gift_cert_num = resp["giftCertificate"]["giftCertificate_detail"]["giftCertificateNumber"]
      @order.update(receipt_number: resp["giftCertificate"]["receipt"]["receiptNumber"])
      order_summary = eval(@order.summary)

      order_summary.each do |project_id, item_summary|
        project = Project.find(project_id)
        source_id = project.source_id
        amount = item_summary.map{|item| (project.item_types.where(name: item[0]).first.price * item[1].to_i).to_i}.inject(0,:+)
        donation_hash = {amount: amount, source_id: source_id, gift_cert_num: gift_cert_num}
        sub_access_token = get_access_token(conn)

        sub_query_params="api_key=#{ENV['GLOBAL_GIVING_API_KEY']}&api_token=#{access_token}"
        sub_donation_url = "api/secure/givingservice/donations?#{query_params}"

        sub_donation_params = gg_order_params_with_gift_cert(donation_hash).to_json

        sub_order_confirmation_response = conn.post do |req|
          req.url sub_donation_url
          req.headers['Accept'] = 'application/json'
          req.headers['Content-Type'] = 'application/json'
          req.body = sub_donation_params
        end

        if sub_order_confirmation_response.status == 200
          logger.info "Order #{@order.id} redeemed GC! Donation hash is #{donation_hash}, GC detail is #{sub_order_confirmation_response.body['donation']['giftCertificate_detail']}"
        else
          logger.info "Order #{@order.id} has failed: #{sub_order_confirmation_response.body}"
          logger.info "Donation hash is #{donation_hash}"
          raise "#{JSON.parse(sub_order_confirmation_response.body)["error_response"]["errors"]["error"].first["error_message"]}"
        end
      end
    else
      logger.info "Order #{@order.id} has failed: #{order_confirmation_response.body}"
      raise "#{JSON.parse(order_confirmation_response.body)["error_response"]["errors"]["error"].first["error_message"]}"
    end
  end

  def fill_order
    @order.send_emails if @order.status == 'complete'
  end

  def set_order
    @order = Order.find(params[:order_id])
  end

  def gg_order_params_with_cc(source_id)
    {
      "donation": {
        "refcode": "DEFAULT",
        "email": @order.email,
        "amount": @order.total_big_decimal.to_i,
        "project": {"id": source_id},
        "payment_detail": {
          "firstname": @order.first_name,
          "lastname": @order.last_name,
          "address": params[:gg][:address_line1],
          "address2": params[:gg][:address_line2],
          "city": params[:gg][:address_city],
          "state": params[:gg][:address_state],
          "iso3166CountryCode": "US",
          "paymentGateway": "braintree",
          "paymentGatewayKey": ENV["GLOBAL_GIVING_PAYMENT_KEY"],
          "paymentGatewayNonce": params[:gg][:payment_nonce]
        }
      }
    }
  end

  def gg_gift_cert_params
    {
      "giftCertificate": {
        "refcode": "DEFAULT",
        "email": @order.email,
        "amount": @order.total_big_decimal.to_i,
        "payment_detail": {
          "firstname": @order.first_name,
          "lastname": @order.last_name,
          "address": params[:stripe][:address_line1],
          "address2": params[:stripe][:address_line2],
          "city": params[:stripe][:address_city],
          "state": params[:stripe][:address_state],
          "iso3166CountryCode": "US",
          "zip": params[:stripe][:address_zip],
          "creditCardNumber": params[:stripe][:number],
          "securityCode": params[:stripe][:cvc_check],
          "expiryDateMonth": params[:stripe][:exp_month],
          "expiryDateYear": params[:stripe][:exp_year]
        }
      }
    }
  end

  def gg_order_params_with_gift_cert(options = {})
    {
      "donation": {
        "refcode": "DEFAULT",
        "email": @order.email,
        "amount": options[:amount],
        "project": {"id": options[:source_id]},
        "giftCertificate_detail": {
          "giftCertificateNumber": options[:gift_cert_num]
        }
      }
    }
  end

  def get_access_token(conn)
    json_params = {"auth_request":{"user":{"email": ENV['GLOBAL_GIVING_EMAIL_ADDRESS'],"password": ENV['GLOBAL_GIVING_PASSWORD']}, "api_key": ENV['GLOBAL_GIVING_API_KEY']}}.to_json

    access_token_response = conn.post do |req|
      req.url 'api/userservice/tokens'
      req.headers['Accept'] = 'application/json'
      req.headers['Content-Type'] = 'application/json'
      req.body = json_params
    end
    if access_token_response.status == 200
      return JSON.parse(access_token_response.body)["auth_response"]["access_token"]
    else
      logger.info "Order #{@order.id} couldn't get an access token!"
      raise "We're having trouble completing your purchase at this time. Please try again later."
    end
  end

end
