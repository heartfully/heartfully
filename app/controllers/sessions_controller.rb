class SessionsController < ApplicationController
  protect_from_forgery except: :create

  def new
  end

  def create
    @user = User.find_by(:email => session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      sign_in @user
      session_params[:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to user_path(@user)
    else
      flash.now.notice = "Invalid email or password"
      render :new, status: :unauthorized
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to sign_in_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password, :remember_me)
  end
end