# == Schema Information
#
# Table name: registries
#
#  id                         :integer          not null, primary key
#  name                       :string(255)      not null
#  url_slug                   :string(255)      not null
#  banner_img                 :string(255)
#  profile_img                :string(255)
#  description                :text
#  address_1                  :string(255)
#  address_2                  :string(255)
#  city                       :string(255)
#  state                      :string(255)
#  postal_code                :string(255)      not null
#  country                    :string(255)
#  created_at                 :datetime
#  updated_at                 :datetime
#  couples_story              :text
#  registry_story             :text
#  banner_image_file_name     :string(255)
#  banner_image_content_type  :string(255)
#  banner_image_file_size     :integer
#  banner_image_updated_at    :datetime
#  profile_image_file_name    :string(255)
#  profile_image_content_type :string(255)
#  profile_image_file_size    :integer
#  profile_image_updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Registry, type: :model do
  describe "#approved_projects" do
    let(:registry) { FactoryGirl.create(:registry_with_projects) }
    
    it 'returns an empty array if no projects are  approved' do
      expect(registry.approved_projects).to eq([])
    end

    it 'returns the approved project if registry_project status is set' do
      rp = RegistryProject.find(registry.registry_projects.first.id)
      rp.approve!
      expect(registry.approved_projects).to eq([registry.projects.first])
    end
  end
end
