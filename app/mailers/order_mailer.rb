class OrderMailer < ActionMailer::Base
  add_template_helper(OrdersHelper)
  default from: "concierge@heartful.ly"

  def order_confirmation(order)
    @order = order
    mail to: "#{order.email}, tech@heartful.ly", subject: "Your Heartful.ly gift has been delivered! "
  end

  def registry_order(order)
    @order = order
    mail to: "#{order.registry.email}, tech@heartul.ly", subject: "#{@order.first_name} #{@order.last_name} just purchased a gift off your Heartful.ly registry!"
  end

  def registry_order_valentine_sender(order)
    @order = order
    mail to: "#{order.email}", subject: "You just donated a gift off registry - #{@order.registry.name} from Heartful.ly!"
  end

  def registry_order_valentine_receiver(order)
    @order = order
    mail to: "#{order.recipient_email}", subject: "You just received a gift off registry - #{@order.registry.name} from Heartful.ly!"
  end

  def email_kate(order)
    @order = order
    mail to: 'kate@heartful.ly, tech@heartul.ly', subject: "Order #{@order.id} summary"
  end
end
