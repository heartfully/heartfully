# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string(255)      not null
#  password_digest     :string(128)      not null
#  remember_digest     :string(128)
#  reset_digest        :string(128)
#  confirmation_digest :string(128)
#  confirmed_at        :datetime
#  first_name          :string(255)      not null
#  last_name           :string(255)
#  profile_img         :string(255)
#  couple_id           :integer
#  organization_id     :integer
#  system_admin?       :boolean          default(FALSE), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
