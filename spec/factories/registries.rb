# == Schema Information
#
# Table name: registries
#
#  id                         :integer          not null, primary key
#  name                       :string(255)      not null
#  url_slug                   :string(255)      not null
#  description                :text
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
#  event_date               :date
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
