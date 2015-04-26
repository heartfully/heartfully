class AddFieldsToProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :headline, :partner
    rename_column :projects, :project_url, :url_slug
    remove_column :projects, :profile_img, :string
    remove_column :projects, :state, :string
    add_column :projects, :extra_content, :text
  end
end
