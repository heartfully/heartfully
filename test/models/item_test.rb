# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  item_type_id :integer          not null
#  purchase_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#  order_id     :integer
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
