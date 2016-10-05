module BirthdaysHelper

  def gift_items_display_for(birthday)
    name = birthday.registrant_first_name
    name.present? ? "#{name}'s birthday wishlist" : "birthday wishlist"
  end
end