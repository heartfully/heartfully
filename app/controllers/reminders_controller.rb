class RemindersController < ApplicationController

   def create
    reminder = Reminder.new(reminder_params)
    if reminder.save
      respond_to do |format|
        format.json { head :ok }
      end
    else
      head :unprocessable_entity
    end
  end

  private

  def reminder_params
    params.require(:reminder).permit(
      :name,
      :email,
      :reminder_date
    )
  end
end