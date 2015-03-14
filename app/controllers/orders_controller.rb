class OrdersController < ApplicationController
  def create
    @registry = Registry.find(params[:registry_id])
    @order = @registry.orders.create(order_params)
    @order.calc_total(params[:items])
  end

  private
    def order_params
      params.require(:order).permit(:email)
    end

end