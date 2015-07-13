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
