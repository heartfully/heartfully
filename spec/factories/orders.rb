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

FactoryGirl.define do
  factory :order do
    email "MyString"
registry 1
status "MyString"
  end

end
