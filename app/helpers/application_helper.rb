module ApplicationHelper
  def dollars(number, options = {})
    number_to_currency(number, { precision: 0 }.merge(options))
  end
end
