class PasswordsController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password][:email].downcase)

    if @user
      @user.create_reset_digest
      UserMailer.password_reset(@user).deliver!
      flash[:notice] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:error] = "Email address not found"
      render :new
    end
  end

  def edit
  end

  def update
    if both_passwords_blank?
      flash.now[:danger] = "Password/confirmation can't be blank"
      render :edit
    elsif @user.update_attributes(user_params)
      sign_in @user
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    # Returns true if password & confirmation are blank.
    def both_passwords_blank?
      params[:user][:password].blank? &&
      params[:user][:password_confirmation].blank?
    end

    # Before filters

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
      unless (@user && @user.confirmed? && @user.authenticate_by(:reset, params[:id]))
        flash[:error] = "Invalid password reset link. Be sure you've confirmed your account."
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        flash[:error] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end

end