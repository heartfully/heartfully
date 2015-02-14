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

FactoryGirl.define do
  factory :organization do
    
  end

end
