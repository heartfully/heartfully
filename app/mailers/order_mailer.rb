class OrderMailer < ActionMailer::Base
  add_template_helper(OrdersHelper)
  default from: "concierge@heartful.ly"

  def order_confirmation(order)
    @order = order
    mail to: "#{order.email}, corey@heartful.ly", subject: "Heartful.ly order confirmation"
  end

  def registry_order(order)
    @order = order
    slug = @order.registry.url_slug
    mail to: "#{order.registry.email}, tech@heartul.ly", subject: "#{@order.first_name} #{@order.last_name} just purchased a gift off your Heartful.ly registry!"
  end

  def email_kate(order)
    @order = order
    mail to: 'kate@heartful.ly, tech@heartul.ly', subject: "Order #{@order.id} summary"
  end
end
