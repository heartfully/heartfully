require 'rails_helper'

RSpec.describe Registry, type: :model do
  describe "#approved_projects" do
    let(:registry) { FactoryGirl.create(:registry_with_projects) }
    
    it 'returns an empty array if no projects are  approved' do
      expect(registry.approved_projects).to eq([])
    end

    it 'returns the approved project if registry_project status is set' do
      rp = RegistryProject.find(registry.registry_projects.first.id)
      rp.update(:status => 'approved')
      expect(registry.approved_projects).to eq([registry.projects.first])
    end
  end
end
