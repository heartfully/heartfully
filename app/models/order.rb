class Order < ActiveRecord::Base
  belongs_to :registry
  has_many :items

  def calc_total(items)
    total = 0.0
    # iterates through all items passed to it
    items.each do |item, quantity|

      # finds the registry's item type
      item_type = self.registry.item_types.where(name: item).first

      # calculates total price from quantity
      total += item_type.price * quantity.to_i

      # finds the item_type's items and assigns an order_id
      item_type.items.limit(quantity.to_i).update_all(:order_id => self.id)
    end

    total
  end
end
