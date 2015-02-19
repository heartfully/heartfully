class CreateProjectCategories < ActiveRecord::Migration
  def change
    create_table :project_categories do |t|
      t.references :project, index: true, :null => false
      t.references :category, index: true, :null => false
      t.timestamps
    end
  end
end
