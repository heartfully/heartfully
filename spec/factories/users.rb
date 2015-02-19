# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string(255)      not null
#  password_digest     :string(128)      not null
#  remember_digest     :string(128)
#  reset_digest        :string(128)
#  reset_sent_at       :datetime
#  confirmation_digest :string(128)
#  confirmed_at        :datetime
#  first_name          :string(255)      not null
#  last_name           :string(255)      not null
#  profile_img         :string(255)
#  registry_id         :integer
#  organization_id     :integer
#  system_admin        :boolean          default(FALSE), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :user do
    email 'Corey@heartfully.com'
    password_digest 'fooFace'
    first_name 'Corey'
    last_name 'Speisman'
  end

end
