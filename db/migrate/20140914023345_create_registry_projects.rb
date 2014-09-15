class CreateRegistryProjects < ActiveRecord::Migration
  def change
    create_table :registry_projects do |t|
      t.references :registry, index: true, null: false
      t.references :project, index: true, null: false

      t.timestamps
    end
  end
end
