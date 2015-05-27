class AddContactInfoToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :entity_if_not_503, :string
    add_column :organizations, :contact_name, :string
    add_column :organizations, :contact_job_title, :string
    add_column :organizations, :contact_email, :string
    add_column :organizations, :contact_phone_number, :string
    change_column :organizations, :admin_id, :integer, :null => true
    rename_column :organizations, :heartyfully_approved, :heartfully_approved
    change_column_default :organizations, :heartfully_approved, false
  end
end
