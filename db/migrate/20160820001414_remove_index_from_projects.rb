class RemoveIndexFromProjects < ActiveRecord::Migration
  def change
    remove_index(:projects, [:organization_id, :name])
  end
end
