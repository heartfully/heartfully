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
    OrderMailer.order_confirmation(self).deliver!
    OrderMailer.email_kate(self).deliver!
    OrderMailer.registry_order(self).deliver!
  end
end
