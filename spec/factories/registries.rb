FactoryGirl.define do
  factory :registry do
    name 'Lovely Couple'
    url_slug 'lovely-couple-registry'
    postal_code '20003'

    factory :registry_with_projects do
      after(:create) do |registry|
        create(:registry_project, registry: registry)
      end
    end
  end

  factory :coreys_registry, :class => Registry do
    name 'Coreys Registry'
    url_slug 'coreys-registry'
    postal_code '20005'
  end
end
