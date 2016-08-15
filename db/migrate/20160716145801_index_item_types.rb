class IndexItemTypes < ActiveRecord::Migration
  def change
    add_index(:item_types, [:project_id, :name, :price], unique: true)
  end
end
