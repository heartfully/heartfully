class ChangeRankedCharityType < ActiveRecord::Migration
  def change
    change_column :organizations, :ranked_charity, :string
  end
end
