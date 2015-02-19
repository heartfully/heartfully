# == Schema Information
#
# Table name: registries
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  url_slug    :string(255)      not null
#  banner_img  :string(255)
#  profile_img :string(255)
#  description :text
#  address_1   :string(255)
#  address_2   :string(255)
#  city        :string(255)
#  state       :string(255)
#  postal_code :string(255)      not null
#  country     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

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
