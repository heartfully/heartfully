class AddRegistryIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :registry_id, :integer, index: true
    add_column :item_types, :quantity, :integer
  end
end
