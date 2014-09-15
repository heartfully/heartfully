class Purchase < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_many :item_types, :through => :items

  validates_presence_of :user_id, :purchased_at
  validates_associated :user

  before_validation :set_default_purchased_at

  def set_default_purchased_at
    self.purchased_at ||= DateTime.now
  end
end

# == Schema Information
#
# Table name: purchases
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  message      :text
#  purchased_at :datetime         not null
#  created_at   :datetime
#  updated_at   :datetime
#
