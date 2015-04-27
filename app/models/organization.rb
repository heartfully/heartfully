class Organization < ActiveRecord::Base
  belongs_to :admin, :class_name => "User"
  has_many :employees, :class_name => "User"
  has_many :projects

  validates_presence_of :name, :admin_id
  validates_associated :admin
  validates_uniqueness_of :name
end

# == Schema Information
#
# Table name: organizations
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :text
#  profile_img :string(255)
#  org_url     :string(255)
#  admin_id    :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#
