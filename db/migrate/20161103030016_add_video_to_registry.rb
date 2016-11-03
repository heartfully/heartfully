class AddVideoToRegistry < ActiveRecord::Migration
  def change
    add_column :registries, :video_url, :string
  end
end
