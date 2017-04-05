class AddEventTypeToRegistry < ActiveRecord::Migration
  def change
    add_column :registries, :event_type, :string
  end
end
