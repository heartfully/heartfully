class OrderMailer < ActionMailer::Base
  add_template_helper(OrdersHelper)
  default from: "Heartful.ly@heartful.ly"
  layout 'user_mailer', except: :birthday_order
  layout :false, only: :birthday_order

  def order_confirmation(order)
    @order = order
    mail to: "#{order.email}", subject: "Your Heartful.ly gift has been delivered!"
  end

  def registry_order(order)
    @order = order
    mail to: "#{order.registry.email}, tech@heartful.ly", subject: "#{@order.first_name} #{@order.last_name} just purchased a gift off your Heartful.ly registry!"
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
    mail to: "#{order.recipient_email}", subject: "You've received a Valentine's Day gift from #{@order.first_name} #{@order.last_name}"
  end

  def campaign_order_kate(order)
    @order = order
    mail to: 'kate@heartful.ly, tech@heartful.ly', subject: "Order #{@order.id} summary"
  end

  def email_kate(order)
    @order = order
    mail to: 'kate@heartful.ly, tech@heartful.ly', subject: "Order #{@order.id} summary"
  end

  def birthday_order_confirmation(order)
    @order = order
    mail to: "#{order.email}", subject: "Your Heartful.ly gift has been delivered!"
  end

  def birthday_order(order)
    @order = order
    mail to: "#{order.registry.email}, tech@heartful.ly", subject: "#{@order.first_name} #{@order.last_name} just purchased a gift off your Heartful.ly registry!"
  end

  def birthday_email_kate(order)
    @order = order
    mail to: 'kate@heartful.ly, tech@heartful.ly', subject: "Birthday order #{@order.id} summary"
  end

  def celebration_order_confirmation(order)
    @order = order
    mail to: "#{order.email}", subject: "Your Heartful.ly gift has been delivered!"
  end

  def celebration_order(order)
    @order = order
    mail to: "#{order.registry.email}, tech@heartful.ly", subject: "#{@order.first_name} #{@order.last_name} just purchased a gift off your Heartful.ly registry!"
  end

  def celebration_email_kate(order)
    @order = order
    mail to: 'kate@heartful.ly, tech@heartful.ly', subject: "Celebration order #{@order.id} summary"
  end
end
