class Item < ActiveRecord::Base
  belongs_to :item_type
  belongs_to :purchase
  has_and_belongs_to_many :orders

  validates_presence_of :name, :item_type_id
  validates_associated :item_type, :purchase
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
#
