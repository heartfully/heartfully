class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users/1
  def show
  end

  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      UserMailer.user_confirmation(@user).deliver!
      flash[:notice] = "Please check your email to activate your account."
      redirect_to projects_path
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  # GET /users/:confirmation_token/confirm?email=:email
  def confirm
    @user = User.find_by(:email => params[:email])

    if @user && !@user.confirmed? && @user.authenticate_by(:confirmation, params[:confirmation_token])
      @user.confirm
      sign_in @user
      flash[:success] = "Account confirmed!"
      redirect_to projects_path
    else
      flash[:error] = "Invalid confirmation link"
      redirect_to root_url
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :first_name,
      :last_name,
      :profile_img
    )
  end
end
