class RemindersController < ApplicationController

   def create
    if Reminder.create(reminder_params)
      respond_to do |format|
        format.json { head :ok }
      end
    else
      render text: "There was an error signing you up."
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