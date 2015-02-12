class AddStatusToRegistryProject < ActiveRecord::Migration
  def change
    add_column :registry_projects, :status, :string
  end
end
