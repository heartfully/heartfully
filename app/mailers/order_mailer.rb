class OrderMailer < ActionMailer::Base
  add_template_helper(OrdersHelper)
  default from: "Heartful.ly@heartful.ly"
  layout 'user_mailer'

  def order_confirmation(order)
    @order = order
    mail to: "#{order.email}", subject: "Your Heartful.ly gift has been delivered! "
  end

  def registry_order(order)
    @order = order
    mail to: "#{order.registry.email}, tech@heartul.ly", subject: "#{@order.first_name} #{@order.last_name} just purchased a gift off your Heartful.ly registry!"
  end

  # def registry_order_valentine_sender(order)
  #   @order = order
  #   mail to: "#{order.email}", subject: "Good news! Your generous donation is on its way!"
  # end
  #
  # def registry_order_valentine_receiver(order)
  #   @order = order
  #   mail to: "#{order.recipient_email}", subject: "You’ve received a Valentine’s Day gift from #{@order.first_name}"
  # end

  def campaign_order_sender(order)
    @order = order
    mail to: "#{order.email}", subject: "Good news! Your generous donation is on its way!"
  end

  def campaign_order_receiver(order)
    @order = order
    mail to: "#{order.recipient_email}", subject: "#{@order.registry.campaign_message}"
  end

  def campaign_order_kate(order)
    @order = order
    mail to: 'kate@heartful.ly, tech@heartul.ly', subject: "Order #{@order.id} summary"
  end

  def email_kate(order)
    @order = order
    mail to: 'kate@heartful.ly, tech@heartul.ly', subject: "Order #{@order.id} summary"
  end
end
