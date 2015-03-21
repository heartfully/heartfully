class OrderMailer < ActionMailer::Base
  add_template_helper(OrdersHelper)
  default from: "concierge@heartful.ly"

  def order_confirmation(order)
    @order = order
    mail to: order.email, subject: "Heartful.ly order confirmation"
  end

  def registry_order(order)
    @order = order
    slug = @order.registry.url_slug
    mail to: find_email(slug), subject: "#{@order.first_name} just ordered you something heartfelt"
  end

  def email_kate(order)
    @order = order
    mail to: 'kate@heartful.ly', subject: "Order #{@order.id} summary"
  end

  private

  def find_email(slug)
    if(slug.downcase == "peterandeva")
      "evitawatkins@gmail.com, petermorrison@utexas.edu"
    elsif(slug.downcase == "wangama")
      "katelynlowery@gmail.com"
    elsif(slug.downcase == "marissaandtravis") 
      "marissanewman85@gmail.com"
    elsif(slug.downcase == "lindseyandmatt")
      "lagardner08@gmail.com, matt.a.levinson@gmail.com"
    end
  end
end