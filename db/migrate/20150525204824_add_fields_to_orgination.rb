class AddFieldsToOrgination < ActiveRecord::Migration
  def change
    add_column :organizations, :in_price_range, :boolean
    add_column :organizations, :sectors, :string
    add_column :organizations, :mission_statement, :text
    add_column :organizations, :tax_exempt, :boolean
    add_column :organizations, :city_province, :string
    add_column :organizations, :country, :string
    add_column :organizations, :annual_budget, :decimal, :precision => 8, :scale => 2
    add_column :organizations, :ranked_charity, :boolean
    add_column :organizations, :referral_source, :text
    add_column :organizations, :heartyfully_approved, :boolean
  end
end
