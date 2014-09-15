class CreateRegistries < ActiveRecord::Migration
  def change
    create_table :registries do |t|
      t.string :name
      t.text :description
      t.references :couple, index: true, null: false

      t.timestamps
    end
  end
end
