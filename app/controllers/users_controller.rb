class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users/1
  def show
    if current_user
      slug = current_user.registry.try(:url_slug)
      if slug
        redirect_to registry_admin_path(slug)
      else
        redirect_to new_registry_path
      end
    end
  end

  def new
    redirect_to user_path(current_user), :notice => "Already logged in" if current_user
    @user = User.new

    # For invited users, we need to add the invitation token
    @invitation_token = params[:invitation_token]
  end

  # GET /users/1/edit
  def edit
  end

  def create
    @user = User.new(user_params)

    # If the user is signing up with an invite token, authenticate it and set their registry appropriately
    unless params[:invitation_token].nil?
      partner_invite = PartnerInvite.find_by(:email => user_params[:email])
      if partner_invite && partner_invite.authenticate_by(:invitation, params[:invitation_token])
        @user.registry_id = partner_invite.registry_id
      else
        flash[:error] = "Invalid email or invitation token. Your account was created, but your invitation seems to be invalid."
      end
    end

    if @user.save
      sign_in @user
      partner_invite.update(:accepted_at => Time.zone.now) if partner_invite
      UserMailer.user_confirmation(@user).deliver!
      # flash[:notice] = "Account created. We'll update you when more projects are available!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    render :edit
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
