class AddPhotoFieldsTProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_photo, :string
    add_column :projects, :project_photo_2, :string
    add_column :projects, :project_photo_3, :string
  end
end
