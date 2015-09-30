module OrderProcess

  def calc_total(items)
    # select all items that have a value
    items = items.select { |key, val| !val.empty? }
    total = 0.0
    # iterates through all items
    items.each do |item, quantity|
      # finds the registry's item type
      item_type = self.registry.item_types.where(name: item).first
      # calculates total price from quantity
      total += item_type.price * quantity.to_i
    end

    self.summary = items.to_s
    self.total = number_to_currency(total)
    self.save
  end

  def send_emails
    OrderMailer.order_confirmation(self).deliver!
    OrderMailer.email_kate(self).deliver!
    OrderMailer.registry_order(self).deliver!
  end
end
