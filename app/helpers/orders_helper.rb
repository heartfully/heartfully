module OrdersHelper

  def order_summary(items)
    hashed_items = eval(items)
    hashed_items.delete_if {|key, value| value == '0' || value.empty? }
    hashed_items
  end

end