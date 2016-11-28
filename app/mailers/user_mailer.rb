class UserMailer < ActionMailer::Base
  default from: "concierge@heartful.ly"
  layout :false, only: :user_confirmation

  def user_confirmation(user)
    @user = user
    mail to: user.email, subject: "Welcome to Heartful.ly!"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

  def partner_invitation(partner_invite)
    @partner_invite = partner_invite
    mail to: @partner_invite.email, subject: "You've been invited to use Heartful.ly!"
  end

end
