class RegistryProject < ActiveRecord::Base
  belongs_to :registry
  belongs_to :project

  before_create :set_status

  validates_presence_of :registry_id, :project_id
  validates_associated :registry, :project

  def approve
    self.status = 'approved'
  end

  private

  def set_status
    self.status = 'pending'
  end
end

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
