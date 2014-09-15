module Api
  module V1
    class PurchasesController < Api::V1::ApiController
      before_action :set_purchase, :only => [:show, :update, :destroy]

      def index
        @purchases = Purchase.all
        render_success @purchases
      end

      # GET /purchases/1
      def show
        render_success @purchase
      end

      # POST /purchases
      def create
        @purchase = Purchase.new(purchase_params)

        if @purchase.save
          render_created @purchase
        else
          render_model_errors @purchase
        end
      end

      # PATCH/PUT /purchases/1
      def update
        if @purchase.update(purchase_params)
          render_success @purchase
        else
          render_model_errors @purchase
        end
      end

      # DELETE /purchases/1
      def destroy
        if @purchase.destroy
          render_destroyed
        else
          render_error("Purchase could not be destroyed.")
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_purchase
        @purchase = Purchase.find_by_id(params[:id])
        if @purchase.blank?
          render_non_existent
          return false
        end
      end

      # Only allow a trusted parameter "white list" through.
      def purchase_params
        params.require(:purchase).permit(:message)
      end

    end
  end
end