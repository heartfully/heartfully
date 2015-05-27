class Organization < ActiveRecord::Base
  belongs_to :admin, :class_name => "User"
  has_many :employees, :class_name => "User"
  has_many :projects

  validates_presence_of :name
end

# == Schema Information
#
# Table name: organizations
#
#  id                   :integer          not null, primary key
#  name                 :string(255)      not null
#  description          :text
#  profile_img          :string(255)
#  org_url              :string(255)
#  admin_id             :integer
#  created_at           :datetime
#  updated_at           :datetime
#  in_price_range       :boolean
#  sectors              :string(255)
#  mission_statement    :text
#  tax_exempt           :boolean
#  city_province        :string(255)
#  country              :string(255)
#  annual_budget        :decimal(8, 2)
#  ranked_charity       :boolean
#  referral_source      :text
#  heartyfully_approved :boolean
#  entity_if_not_503    :string(255)
#  contact_name         :string(255)
#  contact_job_title    :string(255)
#  contact_email        :string(255)
#  contact_phone_number :string(255)
#
