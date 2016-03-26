class AddCampaigns < ActiveRecord::Migration
  def change
    add_column :registries, :type, :string, default: "registry", null: false
    rename_column :registries, :wedding_date, :event_date
  end
end
