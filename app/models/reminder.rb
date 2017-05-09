class Reminder < ActiveRecord::Base
  validates :name, :email, :reminder_date, presence: true
end