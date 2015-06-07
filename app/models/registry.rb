class Registry < ActiveRecord::Base

  ###################
  ## RELATIONSHIPS ##
  ###################

  has_many :partners, :class_name => "User"
  has_many :partner_invites
  has_many :registry_projects
  has_many :projects, :through => :registry_projects
  has_many :item_types, :through => :projects
  has_many :items
  has_many :orders
  has_and_belongs_to_many :guests, :class_name => "User", :join_table => "guests_registries", :association_foreign_key => "guest_id"

  has_attached_file :banner_image
  has_attached_file :profile_image
  validates_attachment_content_type :banner_image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :profile_image, :content_type => /\Aimage\/.*\Z/
  
  #################
  ## VALIDATIONS ##
  #################

  validates_presence_of :name, :url_slug, :postal_code
  validates_uniqueness_of :name, :url_slug
  # TODO a format validation on URL slug
  
  def approved_projects
    projects.joins(:registry_projects).where(:registry_projects => {:approved => true})
  end
end

# == Schema Information
#
# Table name: registries
#
#  id                         :integer          not null, primary key
#  name                       :string(255)      not null
#  url_slug                   :string(255)      not null
#  banner_img                 :string(255)
#  profile_img                :string(255)
#  description                :text
#  address_1                  :string(255)
#  address_2                  :string(255)
#  city                       :string(255)
#  state                      :string(255)
#  postal_code                :string(255)      not null
#  country                    :string(255)
#  created_at                 :datetime
#  updated_at                 :datetime
#  couples_story              :text
#  registry_story             :text
#  banner_image_file_name     :string(255)
#  banner_image_content_type  :string(255)
#  banner_image_file_size     :integer
#  banner_image_updated_at    :datetime
#  profile_image_file_name    :string(255)
#  profile_image_content_type :string(255)
#  profile_image_file_size    :integer
#  profile_image_updated_at   :datetime
#
