class ChangeProjectStringLimit < ActiveRecord::Migration
  def change
    change_column :projects, :how_it_works_step1, :string, :limit => 350
    change_column :projects, :how_it_works_step2, :string, :limit => 350
    change_column :projects, :how_it_works_step3, :string, :limit => 350
    change_column :projects, :how_it_works_step4, :string, :limit => 350
    change_column :projects, :how_it_works_step5, :string, :limit => 350
  end
end
