# == Schema Information
#
# Table name: projects
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  partner         :string(255)
#  description     :text
#  url_slug        :string(255)
#  banner_img      :string(255)
#  city            :string(255)
#  country         :string(255)      not null
#  funding_goal    :decimal(11, 2)
#  closed_at       :datetime
#  public          :boolean          default(TRUE), not null
#  organization_id :integer          not null
#  created_at      :datetime
#  updated_at      :datetime
#  project_photo   :string(255)
#  project_photo_2 :string(255)
#  project_photo_3 :string(255)
#  extra_content   :text
#

FactoryGirl.define do
  factory :project do
    name 'Project Soccer Field'
    country 'Coreystonia'
    public? true
    organization_id 1
    
  end

end
