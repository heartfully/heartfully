class CreateItemTypes < ActiveRecord::Migration
  def change
    create_table :item_types do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, null: false, precision: 9, scale: 2
      t.string :thumbnail_img
      t.references :project, index: true, null: false

      t.timestamps
    end

    add_index(:item_types, [:project_id, :name], unique: true)
  end
end
