class ChangeAnnualBudgetFromNumberToString < ActiveRecord::Migration
  def change
    change_column :organizations, :annual_budget, :string
  end
end
