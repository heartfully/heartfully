module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete(:user_id)
    current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(:id => session[:user_id])
  end

  def current_user=(user)
    @current_user = user
  end

  def signed_in?
    current_user.present?
  end

  def require_auth
    redirect_to sign_in_path unless signed_in?
  end
end