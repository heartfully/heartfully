class OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end

  def create
    @registry = Registry.find(params[:registry_id])
    @order = @registry.orders.create
    @order.calc_total(params[:items])
    redirect_to order_path(@order)
  end

  def finalize
    @order = Order.find(params[:id])
    @order.update_attributes(update_params) && @order.fill_order
    redirect_to new_order_charge_path(@order)
  end

  private
    def order_params
      params.require(:order).permit(:email, :first_name, :last_name, :message)
    end

    def update_params
      params.permit(:email, :first_name, :last_name, :message)
    end
end