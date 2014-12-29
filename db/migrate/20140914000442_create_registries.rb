class CreateRegistries < ActiveRecord::Migration
  def change
    create_table :registries do |t|
      t.string :name, null: false
      t.string :url_slug, null: false
      t.string :banner_img
      t.string :profile_img
      t.text :description
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :postal_code, null: false
      t.string :country

      t.timestamps
    end

    add_index(:registries, :url_slug, unique: true)
  end
end
