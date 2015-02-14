# == Schema Information
#
# Table name: organizations
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :text
#  profile_img :string(255)
#  org_url     :string(255)
#  admin_id    :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
