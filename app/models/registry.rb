class Registry < ActiveRecord::Base
  has_many :partners, :class_name => "User"
  has_many :registry_projects
  has_many :projects, :through => :registry_projects
  has_many :item_types, :through => :projects
  has_many :items, :through => :item_types
  has_and_belongs_to_many :guests, :class_name => "User", :join_table => "guests_registries", :association_foreign_key => "guest_id"

  validates_presence_of :name, :url_slug, :postal_code
end

# == Schema Information
#
# Table name: registries
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  url_slug    :string(255)      not null
#  banner_img  :string(255)
#  profile_img :string(255)
#  description :text
#  address_1   :string(255)
#  address_2   :string(255)
#  city        :string(255)
#  state       :string(255)
#  postal_code :string(255)      not null
#  country     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
