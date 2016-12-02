class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    if @order.registry.url_slug == 'sharethelove'
      render :show_valentine
    end
    if @order.registry.type && @order.registry.type.downcase == 'campaign'
      render :show_campaign
    end
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
      params.require(:order).permit(:email, :first_name, :last_name, :message, :email_subscription)
    end

    def update_params
      params.permit(:email, :first_name, :last_name, :recipient_first_name, :recipient_last_name, :recipient_email, :message, :email_subscription, :delivery_date)
    end
end
