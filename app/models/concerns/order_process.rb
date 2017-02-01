module OrderProcess

  def calc_total(items)
    total = 0.0
    summary = {}
    items.each do |item|
      if summary[item[:project_id]].present?
        summary[item[:project_id]][item[:name]] = item[:quantity].to_i
      else
        item_hash = {}
        item_hash[item[:name]] = item[:quantity].to_i
        summary[item[:project_id]] = item_hash
      end
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
      # Manually send these until I can implement a background job scheduler
      # OrderMailer.campaign_order_receiver(self).deliver! unless self.recipient_email.empty?
      OrderMailer.campaign_order_receiver(self).deliver! if self.delivery_date.blank? && self.recipient_email.present?
      OrderMailer.campaign_order_kate(self).deliver!
    elsif self.registry.type && self.registry.type.downcase == 'birthday'
      OrderMailer.birthday_order_confirmation(self).deliver!
      OrderMailer.birthday_order(self).deliver!
      OrderMailer.birthday_email_kate(self).deliver!
    else
      OrderMailer.order_confirmation(self).deliver!
      OrderMailer.registry_order(self).deliver!
      OrderMailer.email_kate(self).deliver!
    end
  end
end
