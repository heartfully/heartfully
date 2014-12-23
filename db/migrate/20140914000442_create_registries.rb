class CreateRegistries < ActiveRecord::Migration
  def change
    create_table :registries do |t|
      t.string :name
      t.string :url_slug, null: false
      t.string :banner_img
      t.text :description
      t.references :couple, index: true, null: false

      t.timestamps
    end

    add_index(:registries, :url_slug, unique: true)
  end
end
