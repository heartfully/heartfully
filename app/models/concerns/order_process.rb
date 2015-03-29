module OrderProcess

  def calc_total(items)
    total = 0.0
    # iterates through all items passed to it
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

  def fill_order
    hashed_items = eval(self.summary)
    hashed_items.each do |item, quantity|
      # finds the registry's item type
      item_type = self.registry.item_types.where(name: item).first

      # finds the item_type's items and assigns an order_id
      item_type.items.available.limit(quantity.to_i).update_all(:order_id => self.id)
    end
  end

  def send_emails
    if status == 'complete'
      OrderMailer.order_confirmation(self).deliver!
      OrderMailer.email_kate(self).deliver!
      OrderMailer.registry_order(self).deliver!
    end
  end
end