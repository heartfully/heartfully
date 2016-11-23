class RemoveNullFromNameInRegistry < ActiveRecord::Migration
  def change
    change_column_null :registries, :name, true
  end
end
