module OrderProcess

  def calc_total(items)
    total = 0.0
    summary = {}
    items.each do |item|
      summary[item[:name]] = item[:quantity].to_i
      total += item[:price].to_f * item[:quantity].to_i
    end

    self.summary = summary.to_s
    self.total = number_to_currency(total)
    self.save
  end

  def send_emails
    # if self.registry.url_slug == 'sharethelove'
    #   OrderMailer.registry_order_valentine_sender(self).deliver!
    #   OrderMailer.registry_order_valentine_receiver(self).deliver!
    # end
    if self.registry.type && self.registry.type.downcase == 'campaign'
      OrderMailer.campaign_order_sender(self).deliver!
      OrderMailer.campaign_order_receiver(self).deliver!
      OrderMailer.campaign_order_kate(self).deliver!
    else
      OrderMailer.order_confirmation(self).deliver!
      OrderMailer.registry_order(self).deliver!
      OrderMailer.email_kate(self).deliver!
    end
  end
end
