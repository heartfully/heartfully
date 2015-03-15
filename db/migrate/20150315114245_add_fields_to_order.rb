class AddFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :summary, :string
    add_column :orders, :message, :text
  end
end
