class ChargesController < ApplicationController
	before_action :set_order, only: [:new, :create]
  after_action :fill_order, only: [:create]

  def new
  end

	def create
    unless @order.status == 'complete'
      begin
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

				if @order.registry.type.downcase == 'campaign'
					render :create_campaign
				end

      rescue Exception => e
        @order.update_attributes(status: "error")
        flash[:error] = e.message
        render 'new'
      end
    end
  end

  private

  def fill_order
    @order.send_emails if @order.status == 'complete'
  end

  def set_order
    @order = Order.find(params[:order_id])
  end
end
