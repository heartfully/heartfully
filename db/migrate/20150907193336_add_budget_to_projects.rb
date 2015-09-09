class AddBudgetToProjects < ActiveRecord::Migration
  def up
    add_attachment :projects, :budget
  end

  def down
    remove_attachment :projects, :budget
  end
end
