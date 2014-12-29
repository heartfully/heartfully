class SessionsController < ApplicationController
  protect_from_forgery except: :create

  def new
  end

  def create
    @user = User.find_by(:email => session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      sign_in @user
      redirect_to '/projects'
    else
      flash.now.notice = "Invalid email or password"
      render :new, status: :unauthorized
    end
  end

  def destroy
    sign_out
    redirect_to sign_in_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end