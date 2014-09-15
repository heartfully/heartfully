module Api
  module V1
    class ItemsController < Api::V1::ApiController
      before_action :set_item, :only => [:show, :update, :destroy]

      def index
        @items = Item.all
        render_success @items
      end

      # GET /items/1
      def show
        render_success @item
      end

      # POST /items
      def create
        @item = Item.new(item_params)

        if @item.save
          render_created @item
        else
          render_model_errors @item
        end
      end

      # PATCH/PUT /items/1
      def update
        if @item.update(item_params)
          render_success @item
        else
          render_model_errors @item
        end
      end

      # DELETE /items/1
      def destroy
        if @item.destroy
          render_destroyed
        else
          render_error("Item could not be destroyed.")
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_item
        @item = Item.find_by_id(params[:id])
        if @item.blank?
          render_non_existent
          return false
        end
      end

      # Only allow a trusted parameter "white list" through.
      def item_params
        params.require(:item).permit(:name, :item_type_id)
      end

    end
  end
end