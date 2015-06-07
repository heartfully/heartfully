class RegistryProject < ActiveRecord::Base
  belongs_to :registry
  belongs_to :project

  validates_presence_of :registry_id, :project_id
  validates_associated :registry, :project

  def approve!
    self.update_attributes(:approved => true)
    fill_registry_items
  end

  private

  def fill_registry_items
    self.registry.item_types.each do |item_type|
      item_type.quantity.times { |count| registry.items.create(name: "#{item_type.name} #{count}", item_type_id: item_type.id)} if item_type.quantity
    end
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
#  approved    :boolean          default(FALSE)
#
