class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.references :item_type, index: true, null: false
      t.references :purchase, index: true

      t.timestamps
    end
  end
end
