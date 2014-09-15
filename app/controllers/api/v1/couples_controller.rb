module Api
  module V1
    class CouplesController < Api::V1::ApiController
      before_action :set_couple, :only => [:show, :update, :destroy]

      def index
        @couples = Couple.all
        render_success @couples
      end

      # GET /couples/1
      def show
        render_success @couple
      end

      # POST /couples
      def create
        @couple = Couple.new(couple_params)

        if @couple.save
          render_created @couple
        else
          render_model_errors @couple
        end
      end

      # PATCH/PUT /couples/1
      def update
        if @couple.update(couple_params)
          render_success @couple
        else
          render_model_errors @couple
        end
      end

      # DELETE /couples/1
      def destroy
        if @couple.destroy
          render_destroyed
        else
          render_error("Couple could not be destroyed.")
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_couple
        @couple = Couple.find_by_id(params[:id])
        if @couple.blank?
          render_non_existent
          return false
        end
      end

      # Only allow a trusted parameter "white list" through.
      def couple_params
        params.require(:couple).permit(:name, :profile_img, :address_1, :address_2, :city, :state, :postal_code, :country)
      end

    end
  end
end