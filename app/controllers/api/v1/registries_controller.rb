module Api
  module V1
    class RegistriesController < Api::V1::ApiController
      before_action :set_registry, :only => [:show, :update, :destroy]

      def index
        @registries = Registry.all
        render_success @registries
      end

      # GET /registries/1
      def show
        render_success @registry
      end

      # POST /registries
      def create
        @registry = Registry.new(registry_params)

        if @registry.save
          render_created @registry
        else
          render_model_errors @registry
        end
      end

      # PATCH/PUT /registries/1
      def update
        if @registry.update(registry_params)
          render_success @registry
        else
          render_model_errors @registry
        end
      end

      # DELETE /registries/1
      def destroy
        if @registry.destroy
          render_destroyed
        else
          render_error("Registry could not be destroyed.")
        end
      end

      def projects
      end
      private

      # Use callbacks to share common setup or constraints between actions.
      def set_registry
        @registry = Couple.find_by_id(params[:couple_id]).registry
        if @registry.blank?
          render_non_existent
          return false
        end
      end

      # Only allow a trusted parameter "white list" through.
      def registry_params
        params.require(:registry).permit(:name, :description)
      end

    end
  end
end