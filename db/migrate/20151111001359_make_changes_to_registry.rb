class MakeChangesToRegistry < ActiveRecord::Migration
  def change
    remove_column :registries, :city
    remove_column :registries, :state
    remove_column :registries, :postal_code
    remove_column :registries, :banner_img
    remove_column :registries, :profile_img
    add_column :registries, :city_state, :string
  end
end
