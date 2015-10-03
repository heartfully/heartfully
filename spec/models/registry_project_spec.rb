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
  
  describe "#approve" do
    let(:registry_project) { FactoryGirl.create(:registry_project) }

    it "has a status of pending by default" do
      expect(registry_project.approved).to eq(false) 
    end

    it "sets status to approve" do
      registry_project.approve!
      expect(registry_project.approved).to eq(true)
    end
  end
end
