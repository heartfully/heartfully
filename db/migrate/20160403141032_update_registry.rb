class UpdateRegistry < ActiveRecord::Migration
  def change
    rename_column :registries, :description, :campaign_message
    add_column :registries, :tweet, :string
  end
end
