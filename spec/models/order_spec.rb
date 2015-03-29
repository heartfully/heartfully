# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  email       :string(255)
#  registry_id :integer
#  status      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  total       :string(255)
#  first_name  :string(255)
#  last_name   :string(255)
#  summary     :text
#  message     :text
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
