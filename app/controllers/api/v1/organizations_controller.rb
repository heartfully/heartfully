module Api
  module V1
    class OrganizationsController < Api::V1::ApiController
      before_action :set_organization, :only => [:show, :update, :destroy]

      def index
        @organizations = Organization.all
        render_success @organizations
      end

      # GET /organizations/1
      def show
        render_success @organization
      end

      # POST /organizations
      def create
        @organization = Organization.new(organization_params)

        if @organization.save
          render_created @organization
        else
          render_model_errors @organization
        end
      end

      # PATCH/PUT /organizations/1
      def update
        if @organization.update(organization_params)
          render_success @organization
        else
          render_model_errors @organization
        end
      end

      # DELETE /organizations/1
      def destroy
        if @organization.destroy
          render_destroyed
        else
          render_error("Organization could not be destroyed.")
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_organization
        @organization = Organization.find_by_id(params[:id])
        if @organization.blank?
          render_non_existent
          return false
        end
      end

      # Only allow a trusted parameter "white list" through.
      def organization_params
        params.require(:organization).permit(:name, :description, :profile_img, :admin_id)
      end

    end
  end
end