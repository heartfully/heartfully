class CreateCouples < ActiveRecord::Migration
  def change
    create_table :couples do |t|
      t.string :name, null: false
      t.string :profile_img
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :postal_code, null: false
      t.string :country

      t.timestamps
    end
  end
end
