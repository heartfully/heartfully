FactoryGirl.define do
  factory :registry do
  end

  factory :coreys_registry, :class => Registry do
    name 'Coreys Registry'
    url_slug '/coreys-registry'
    postal_code '20005'
  end
end
