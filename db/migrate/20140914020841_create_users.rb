class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|

      ## Auth fields
      t.string :email, null: false
      # The hashed password
      t.string :password_digest, limit: 128, null: false
      # The hashed remember_me token
      t.string :remember_digest, limit: 128
      # The hashed password reset token
      t.string :reset_digest, limit: 128
      t.datetime :reset_sent_at
      # The hashed confirmation token
      t.string :confirmation_digest, limit: 128
      t.datetime :confirmed_at

      #### Heartful.ly specific attributes
      t.string :first_name, null: false
      t.string :last_name
      t.string :profile_img
      t.references :couple, index: true
      t.references :organization, index: true
      t.boolean :system_admin, null: false, default: false, index: true

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end