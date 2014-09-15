class CreateJoinTableGuestRegistry < ActiveRecord::Migration
  def change
    create_join_table :guests, :registries do |t|
      t.index [:guest_id, :registry_id]
      t.index [:registry_id, :guest_id]
    end
  end
end
