class AddRecipientFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :recipient_first_name, :string
    add_column :orders, :recipient_last_name, :string
    add_column :orders, :recipient_email, :string
  end
end
