module Api
  module V1
    class UsersController < Api::V1::ApiController
      before_action :set_user, :only => [:show, :update, :destroy]

      def index
        @users = User.all
        render_success @users
      end

      # GET /users/1
      def show
        render_success @user
      end

      # POST /users
      def create
        @user = User.new(user_params)

        if @user.save
          render_created @user
        else
          render_model_errors @user
        end
      end

      # PATCH/PUT /users/1
      def update
        if @user.update(user_params)
          render_success @user
        else
          render_model_errors @user
        end
      end

      # DELETE /users/1
      def destroy
        if @user.destroy
          render_destroyed
        else
          render_error("User could not be destroyed.")
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find_by_id(params[:id])
        if @user.blank?
          render_non_existent
          return false
        end
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name, :profile_img, :couple_id, :organization_id)
      end

    end
  end
end