FactoryGirl.define do
  factory :registry_project do
    association :registry, :factory => :coreys_registry
    project
  end

end
