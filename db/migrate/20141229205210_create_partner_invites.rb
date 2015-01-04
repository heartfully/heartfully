class CreatePartnerInvites < ActiveRecord::Migration
  def change
    create_table :partner_invites do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, index: true, null: false
      t.references :registry, index: true, null: false
      t.string :invitation_digest, limit: 128
      t.datetime :accepted_at
      t.datetime :invalidated_at

      t.timestamps
    end
  end
end
