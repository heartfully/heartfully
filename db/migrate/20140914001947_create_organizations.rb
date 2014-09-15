class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.text :description
      t.string :profile_img
      t.references :admin, index: true, null: false

      t.timestamps
    end
  end
end
