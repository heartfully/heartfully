class UserMailer < ActionMailer::Base
  default from: "concierge@heartful.ly"

  def user_confirmation(user)
    @user = user
    mail to: user.email, subject: "Account confirmation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end