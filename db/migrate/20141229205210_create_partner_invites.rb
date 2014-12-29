class CreatePartnerInvites < ActiveRecord::Migration
  def change
    create_table :partner_invites do |t|
      t.string :email
      t.references :registry, index: true, null: false

      t.timestamps
    end
  end
end
