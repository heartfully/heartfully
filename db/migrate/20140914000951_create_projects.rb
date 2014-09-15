class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :headline
      t.text :description
      t.string :banner_img
      t.string :city
      t.string :state
      t.string :country, null: false, index: true
      t.decimal :funding_goal, index: true, precision: 11, scale: 2
      t.datetime :closed_at
      t.boolean :public?, null: false, default: true, index: true
      t.references :organization, index: true, null: false

      t.timestamps
    end

    add_index(:projects, [:organization_id, :name], unique: true)
  end
end
