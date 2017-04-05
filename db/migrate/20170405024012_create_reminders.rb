class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :name
      t.string :email
      t.date :reminder_date
    end
  end
end
