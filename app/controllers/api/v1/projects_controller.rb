module Api
  module V1
    class ProjectsController < Api::V1::ApiController
      before_action :set_project, :only => [:show, :update, :destroy]

      def index
        @projects = Project.filter(filterable_params).paginate(:page => params[:page], :per_page => 18).where(public: true)
        render_success @projects
      end

      # GET /projects/1
      def show
        render_success @project
      end

      # POST /projects
      def create
        @project = Project.new(project_params)

        if @project.save
          render_created @project
        else
          render_model_errors @project
        end
      end

      # PATCH/PUT /projects/1
      def update
        if @project.update(project_params)
          render_success @project
        else
          render_model_errors @project
        end
      end

      # DELETE /projects/1
      def destroy
        if @project.destroy
          render_destroyed
        else
          render_error("Project could not be destroyed.")
        end
      end

      private

        # Use callbacks to share common setup or constraints between actions.
        def set_project
          @project = Project.find_by_id(params[:id])
          if @project.blank?
            render_non_existent
            return false
          end
        end

        # Only allow a trusted parameter "white list" through.
        def project_params
          params.require(:project).permit(:name, :partner, :description, :url_slug, :banner_img, :city, :country, :funding_goal, :public?, :project_photo, :project_photo_2, :project_photo_3, :extra_content)
        end

        def filterable_params
          { :in_category => params[:categories] }
        end

    end
  end
end
