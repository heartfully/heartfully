class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :user, index: true, null: false
      t.text :message
      t.datetime :purchased_at, null: false

      t.timestamps
    end
  end
end
