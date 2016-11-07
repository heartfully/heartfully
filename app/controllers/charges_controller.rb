class ChargesController < ApplicationController
	before_action :set_order, only: [:new, :create]
  after_action :fill_order, only: [:create]

  def new
  end

	def create
    raise params.inspect
    unless @order.status == 'complete'
      begin
        if @order.registry.projects.first.source_id.present?
          gg_order = process_global_giving_order
          if gg_order["donation"]
            @order.update(receipt_number: gg_order["donation"]["receipt"]["receiptNumber"], status: 'complete')
            render :create_global_giving
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

  def process_global_giving_order
    json_params = {"auth_request":{"user":{"email": ENV['GLOBAL_GIVING_EMAIL_ADDRESS'],"password": ENV['GLOBAL_GIVING_PASSWORD']}, "api_key": ENV['GLOBAL_GIVING_API_KEY']}}.to_json

    conn = Faraday.new('https://api.globalgiving.org') do |conn|
      conn.request :url_encoded
      conn.adapter Faraday.default_adapter
    end

    access_token_response = conn.post do |req|
      req.url 'api/userservice/tokens'
      req.headers['Accept'] = 'application/json'
      req.headers['Content-Type'] = 'application/json'
      req.body = json_params
    end
    if access_token_response.status == 200
      access_token = JSON.parse(access_token_response.body)["auth_response"]["access_token"]

      query_params="api_key=#{ENV['GLOBAL_GIVING_API_KEY']}&api_token=#{access_token}"
      donation_url = "api/secure/givingservice/donations?#{query_params}"

      donation_params = {"donation":
        {"refcode": "DEFAULT",
          "email": @order.email,
          "amount": @order.total.match(/\$(\d+)\./)[1],
          "project": {"id": @order.registry.projects.first.source_id},
          "payment_detail":
            {"firstname": @order.first_name,
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
              "expiryDateYear": params[:stripe][:exp_year]}}}.to_json

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
    else
      logger.info "Order #{@order.id} couldn't get an access token!"
      raise "We're having trouble completing your purchase at this time. Please try again later."
    end
  end

  def fill_order
    @order.send_emails if @order.status == 'complete'
  end

  def set_order
    @order = Order.find(params[:order_id])
  end
end
