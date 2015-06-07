class ItemType < ActiveRecord::Base
  belongs_to :project
  has_many :items, :dependent => :destroy
  has_many :purchases, :through => :items

  validates_presence_of :name, :price, :project_id
  validates_associated :project
  validates_numericality_of :price
  # validates_uniqueness_of :name

end

# == Schema Information
#
# Table name: item_types
#
#  id            :integer          not null, primary key
#  name          :string(255)      not null
#  description   :text
#  price         :decimal(9, 2)    not null
#  thumbnail_img :string(255)
#  project_id    :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#
