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

require 'test_helper'

class RegistryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
