class OrderMailer < ActionMailer::Base
  add_template_helper(OrdersHelper)
  default from: "concierge@heartful.ly"

  def order_confirmation(order)
    @order = order
    mail to: order.email, subject: "Heartful.ly order confirmation"
  end

  def registry_order(registry_owner)
  end

  def email_kate(order)
    @order = order
    mail to: 'kate@heartful.ly', subject: "Order #{@order.id} summary"
  end
end