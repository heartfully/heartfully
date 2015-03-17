class OrderMailer < ActionMailer::Base
  default from: "concierge@heartful.ly"

  def order_confirmation(order)
    @order = order
    mail to: order.email, subject: "Heartful.ly order confirmation"
  end

  def registry_order(registry_owner)
  end
end