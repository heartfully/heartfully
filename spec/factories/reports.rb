# == Schema Information
#
# Table name: reports
#
#  id                              :integer          not null, primary key
#  number_of_benefitters           :integer
#  number_of_communities_served    :integer
#  number_of_trainings_complete    :integer
#  number_of_buildings_constructed :string(255)
#  other_benefits                  :string(255)
#  impact_measurement              :text
#  forward_steps                   :text
#  thank_you_message               :text
#  photo1_file_name                :string(255)
#  photo1_content_type             :string(255)
#  photo1_file_size                :integer
#  photo1_updated_at               :datetime
#  photo2_file_name                :string(255)
#  photo2_content_type             :string(255)
#  photo2_file_size                :integer
#  photo2_updated_at               :datetime
#  photo3_file_name                :string(255)
#  photo3_content_type             :string(255)
#  photo3_file_size                :integer
#  photo3_updated_at               :datetime
#  photo4_file_name                :string(255)
#  photo4_content_type             :string(255)
#  photo4_file_size                :integer
#  photo4_updated_at               :datetime
#  photo5_file_name                :string(255)
#  photo5_content_type             :string(255)
#  photo5_file_size                :integer
#  photo5_updated_at               :datetime
#  organization_id                 :integer
#  created_at                      :datetime
#  updated_at                      :datetime
#

FactoryGirl.define do
  factory :report, :class => 'Reports' do
    number_of_benefitters 1
number_of_communities_served 1
number_of_trainings_complete 1
number_of_buildings_constructed "MyString"
other_benefits "MyString"
impact_measurement "MyText"
forward_steps "MyText"
thank_you_message "MyText"
photo1 ""
photo2 ""
photo3 ""
photo4 ""
photo5 ""
organization_id 1
  end

end
