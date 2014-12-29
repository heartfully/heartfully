# == Schema Information
#
# Table name: registries
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  url_slug    :string(255)      not null
#  banner_img  :string(255)
#  description :text
#  couple_id   :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class RegistryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
