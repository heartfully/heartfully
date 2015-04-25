class AddCouplesStoryToRegistry < ActiveRecord::Migration
  def change
    add_column :registries, :couples_story, :text
  end
end
