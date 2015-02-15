# == Schema Information
#
# Table name: registry_projects
#
#  id          :integer          not null, primary key
#  registry_id :integer          not null
#  project_id  :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe RegistryProject, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
