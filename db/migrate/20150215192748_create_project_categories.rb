class CreateProjectCategories < ActiveRecord::Migration
  def change
    create_table :project_categories do |t|
      t.references :project, index: true
      t.references :category, index: true
      t.timestamps
    end
  end
end
