class AddWeddingDateToRegistries < ActiveRecord::Migration
  def change
    add_column :registries, :wedding_date, :date
  end
end
