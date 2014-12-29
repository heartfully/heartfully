class Registry < ActiveRecord::Base
  belongs_to :couple
  has_many :registry_projects
  has_many :projects, :through => :registry_projects
  has_many :item_types, :through => :projects
  has_many :items, :through => :item_types
  has_and_belongs_to_many :guests, :class_name => "User", :join_table => "guests_registries", :association_foreign_key => "guest_id"

  validates_presence_of :name, :couple_id
  validates_associated :couple
end

# == Schema Information
#
# Table name: registries
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  url_slug    :string(255)      not null
#  banner_img  :string(255)
#  description :text
#  couple_id   :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#
