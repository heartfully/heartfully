class Removeapprovedfromregistryproject < ActiveRecord::Migration
  def change
    remove_column :registry_projects, :approved
  end
end
