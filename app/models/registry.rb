class Registry < ActiveRecord::Base

  ###################
  ## RELATIONSHIPS ##
  ###################

  has_many :partners, :class_name => "User", dependent: :nullify
  has_many :partner_invites
  has_many :registry_projects
  has_many :projects, :through => :registry_projects, dependent: :destroy
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

  validates_presence_of :name, :url_slug
  validates_uniqueness_of :name, :url_slug
  # TODO a format validation on URL slug
  validate :url_slug_restrictions

  def url_slug_restrictions
    if url_slug.match(/^[a-zA-Z0-9]([a-zA-Z0-9\-]*[a-zA-Z0-9])?$/).nil?
      errors.add(:url_slug, "can only contain letters, numbers, and hyphens, and cannot begin or end with a hyphen")
    end
  end

  def reference_name
    registrant_first_name.present? ? registrant_first_name : name
  end

  def total_raised
    orders.complete.to_a.sum(&:total_big_decimal).to_i
  end

end

# == Schema Information
#
# Table name: registries
#
#  id                         :integer          not null, primary key
#  name                       :string(255)      not null
#  url_slug                   :string(255)      not null
#  campaign_message           :text
#  address_1                  :string(255)
#  address_2                  :string(255)
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
#  city_state                 :string(255)
#  event_date                 :date
#  email                      :string
#  type                       :string  
#  tweet                      :string
