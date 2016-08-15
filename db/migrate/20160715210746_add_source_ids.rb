class AddSourceIds < ActiveRecord::Migration
  def change
    add_column :projects, :source_id, :integer
    add_column :organizations, :source_id, :integer

    remove_index :item_types, column: [:project_id, :name]
  end
end
