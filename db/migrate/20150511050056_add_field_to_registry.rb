class AddFieldToRegistry < ActiveRecord::Migration
  def change
    add_column :registries, :registry_story, :text
  end
end
