class OrdersController < ApplicationController
  def create
    @registry = Registry.find(params[:registry_id])
    @order = @registry.orders.create(order_params)
    @order.calc_total(params[:items])
    redirect_to new_order_charge_path(@order)
  end

  private
    def order_params
      params.require(:order).permit(:email)
    end

end