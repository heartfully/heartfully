class Couple < ActiveRecord::Base
  has_many :partners, :class_name => "User"
  has_one :registry
  has_many :projects, :through => :registry

  validates_presence_of :name, :postal_code, :country
end

# == Schema Information
#
# Table name: couples
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  profile_img :string(255)
#  address_1   :string(255)
#  address_2   :string(255)
#  city        :string(255)
#  state       :string(255)
#  postal_code :string(255)      not null
#  country     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
