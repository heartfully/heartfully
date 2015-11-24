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
#  wedding_date               :date
#

require 'test_helper'

class RegistryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
