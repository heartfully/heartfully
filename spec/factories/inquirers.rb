# == Schema Information
#
# Table name: inquirers
#
#  id                       :integer          not null, primary key
#  name                     :string(255)
#  partner_name             :string(255)
#  email                    :string(255)
#  preferred_contact_method :string(255)
#  phone                    :string(255)
#  message                  :text
#  created_at               :datetime
#  updated_at               :datetime
#

FactoryGirl.define do
  factory :inquirer do
    name "MyString"
partner_name "MyString"
email "MyString"
preferred_contact_method "MyString"
message "MyText"
  end

end
