module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def sign_out
    forget(current_user)
    session.delete(:user_id)
    current_user = nil
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(:id => session[:user_id])
    elsif cookies.signed[:user_id]
      user = User.find_by(:id => cookies.signed[:user_id])
      if user && user.authenticate_by(:remember, cookies[:remember_token])
        sign_in user
        current_user = user
      end
    end
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