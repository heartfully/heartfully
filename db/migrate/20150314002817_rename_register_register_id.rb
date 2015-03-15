class RenameRegisterRegisterId < ActiveRecord::Migration
  def change
    rename_column :orders, :registry, :registry_id
  end
end
