class ProjectsController < ApplicationController
  before_action :require_auth, :except => [:index, :show, :select]
  before_action :set_project, only: [:show, :edit, :update, :destroy, :select]

  # GET /projects
  def index
    @projects = Project.filter(filterable_params).paginate(:page => params[:page], :per_page => 9).where(public: true)
    @project_last_page = @projects.total_pages
    @projects = Project.projects_with_new_variable(@projects)
    @categories = Category.order("name ASC")
  end

  # GET /projects/1
  def show
    # @project = @project.decorate
  end
  
  def select
    print "I WAS HIT !!!!!!!!!!!!!"
  end


  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find_by(url_slug: params[:url_slug])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:name, :partner, :description, :url_slug, :banner_img, :city, :country, :funding_goal, :public?, :project_photo, :project_photo_2, :project_photo_3, :extra_content)
    end

    def filterable_params
      { :in_category => params[:categories] }
    end
end
