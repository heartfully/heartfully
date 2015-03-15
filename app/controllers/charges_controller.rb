class ChargesController < ApplicationController
	before_action :set_order, only: [:new, :create]

  def new
  end

	def create
    if @order.status.nil?
      begin
        customer = Stripe::Customer.create(
          email: @order.email,
          card: params[:stripe],
          metadata: {
            project_name: @order.registry.approved_projects.first.name,
            price: @order.total,
            message: @order.message,
            overview: @order.summary
          }
        )

        Stripe::Charge.create(
          customer: customer.id,
          amount: @order.total.tr('$,.', '').to_i,
          currency: 'usd',
          metadata: {
            project_name: @order.registry.approved_projects.first.name,
            price: @order.total,
            message: @order.message,
            overview: @order.summary
          },
          receipt_email: @order.email,
          description: "A charge from Heartful.ly"
        )

        @order.complete

      rescue Exception => e
        flash[:error] = e.message
        render 'new'
      end
    end
  end

  private

    def set_order
      @order = Order.find(params[:order_id])
    end
end
