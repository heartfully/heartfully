class Item < ActiveRecord::Base
  belongs_to :item_type
  belongs_to :purchase
  belongs_to :orders

  validates_presence_of :name, :item_type_id
  validates_associated :item_type

  scope :purchased, -> { where.not(order_id: nil) }
  scope :available, -> { where(order_id: nil) }
end

# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  item_type_id :integer          not null
#  purchase_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#  order_id     :integer
#
