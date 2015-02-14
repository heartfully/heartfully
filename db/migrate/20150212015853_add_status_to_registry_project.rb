class AddStatusToRegistryProject < ActiveRecord::Migration
  def change
    add_column :registry_projects, :approved?, :boolean, :default => false
  end
end
