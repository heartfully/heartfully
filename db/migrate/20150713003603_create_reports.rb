class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :number_of_benefitters
      t.integer :number_of_communities_served
      t.integer :number_of_trainings_complete
      t.string :number_of_buildings_constructed
      t.string :other_benefits
      t.text :impact_measurement
      t.text :forward_steps
      t.text :thank_you_message
      t.attachment :photo1
      t.attachment :photo2
      t.attachment :photo3
      t.attachment :photo4
      t.attachment :photo5
      t.integer :organization_id

      t.timestamps
    end
  end
end
