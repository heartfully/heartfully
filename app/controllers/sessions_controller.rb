class SessionsController < ApplicationController
  protect_from_forgery except: :create

  def new
  end

  def create
    @user = User.find_by(:email => session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      sign_in @user
      session_params[:remember_me] == '1' ? remember(@user) : forget(@user)
      set_registry_project if session[:project_slug]

      slug = current_user.registry.try(:url_slug)
      redirect_to slug ? registry_admin_path(slug) : user_path(@user)
    else
      flash[:notice] = "Invalid email or password"
      render :new, status: :unauthorized
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_path
  end

  private

  def set_registry_project
    @user.registry.projects << Project.find_by_url_slug(session[:project_slug]) if @user.registry
    session.delete(:project_slug)
  end

  def session_params
    params.require(:session).permit(:email, :password, :remember_me)
  end
end
