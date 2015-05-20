class CreateInquirers < ActiveRecord::Migration
  def change
    create_table :inquirers do |t|
      t.string :name
      t.string :partner_name
      t.string :email
      t.string :preferred_contact_method
      t.string :phone
      t.text :message

      t.timestamps
    end
  end
end
