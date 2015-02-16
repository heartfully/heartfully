# == Schema Information
#
# Table name: projects
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  headline        :string(255)
#  description     :text
#  project_url     :string(255)
#  profile_img     :string(255)
#  banner_img      :string(255)
#  city            :string(255)
#  state           :string(255)
#  country         :string(255)      not null
#  funding_goal    :decimal(11, 2)
#  closed_at       :datetime
#  public          :boolean          default(TRUE), not null
#  organization_id :integer          not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
