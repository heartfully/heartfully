require 'rails_helper'

RSpec.describe RegistryProject, :type => :model do
  
  describe "#approve" do
    let(:registry_project) { FactoryGirl.create(:registry_project) }

    it "has a status of pending by default" do
      expect(registry_project.status).to eq('pending') 
    end

    it "sets status to approve" do
      registry_project.approve
      registry_project.save
      expect(registry_project.status).to eq('approved')
    end
  end
end
