class AddContactInfoToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :organizations, :string
    add_column :organizations, :contact_name, :string
    add_column :organizations, :contact_job_title, :string
    add_column :organizations, :contact_email, :string
    add_column :organizations, :contact_phone_number, :string
  end
end
