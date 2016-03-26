class AddCampaigns < ActiveRecord::Migration
  def change
    add_column :registries, :type, :string
    rename_column :registries, :wedding_date, :event_date
  end
end
