class AddLotsOfFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :contact_name, :string
    add_column :projects, :contact_email, :string
    add_column :projects, :contact_phone_number, :string
    add_column :projects, :sector, :string
    add_column :projects, :overview, :text
    add_column :projects, :problem, :text
    add_column :projects, :solution, :text
    add_column :projects, :how_it_works_step1, :string
    add_column :projects, :how_it_works_step2, :string
    add_column :projects, :how_it_works_step3, :string
    add_column :projects, :how_it_works_step4, :string
    add_column :projects, :how_it_works_step5, :string
    add_column :projects, :importance, :text
    add_column :projects, :sustainability, :text
    add_column :projects, :staff_quote, :string
    add_attachment :projects, :photo1
    add_attachment :projects, :photo2
    add_attachment :projects, :photo3
    add_attachment :projects, :photo4
    add_attachment :projects, :photo5
    add_column :projects, :certified, :boolean
  end
end
