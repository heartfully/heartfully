class AddNamesToRegistries < ActiveRecord::Migration
  def change
    add_column :registries, :registrant_first_name, :string
    add_column :registries, :registrant_last_name, :string
    add_column :registries, :registrant_type, :string
    add_column :registries, :partner_first_name, :string
    add_column :registries, :partner_last_name, :string
    add_column :registries, :partner_type, :string
  end
end
