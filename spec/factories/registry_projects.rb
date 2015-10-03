# == Schema Information
#
# Table name: registry_projects
#
#  id          :integer          not null, primary key
#  registry_id :integer          not null
#  project_id  :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :registry_project do
    association :registry, :factory => :coreys_registry
    project
  end

end
