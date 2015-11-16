class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def create
    @registry = Registry.find(params[:registry_id])
    @order = @registry.orders.create
    @order.calc_total(params[:items])

    respond_to do |format|
      format.html { redirect_to order_path(@order) }
      format.json { render :json => order_path(@order), :status => :ok }
    end
  end

  def finalize
    @order = Order.find(params[:id])
    @order.update_attributes(update_params)
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
