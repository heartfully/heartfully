class ChargesController < ApplicationController
	before_action :set_order, only: [:new, :create]

  def new
  end

	def create
    begin
      customer = Stripe::Customer.create(
        email: @order.email,
        card: params[:stripe],
        metadata: {
          project_name: @order.registry.approved_projects.first.name,
          price: @order.total,
        }
      )

      Stripe::Charge.create(
        customer: customer.id,
        amount: @order.total.tr('$,.', '').to_i,
        currency: 'usd',
        description: "This would be incredible if this worked"
      )

    rescue Exception => e
      flash[:error] = e.message
      render 'new'
    end
  end

  private

    def set_order
      @order = Order.find(params[:order_id])
    end
end
