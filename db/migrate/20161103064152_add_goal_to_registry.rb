class AddGoalToRegistry < ActiveRecord::Migration
  def change
    add_column :registries, :goal, :integer
  end
end
