# == Schema Information
#
# Table name: item_types
#
#  id            :integer          not null, primary key
#  name          :string(255)      not null
#  description   :text
#  price         :decimal(9, 2)    not null
#  thumbnail_img :string(255)
#  project_id    :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#  quantity      :integer
#

require 'test_helper'

class ItemTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
