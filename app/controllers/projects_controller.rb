class ProjectsController < ApplicationController
  before_action :require_auth, :only => [:update, :destroy]
  before_action :set_project, only: [:show, :update, :destroy, :select]
  skip_before_filter :verify_authenticity_token, only: :select
  # GET /projects
  def index
    if params[:search].present?
      @projects = Project.includes(:organization).search_by_lots_of_fields(params[:search]).where(public: true).paginate(page: params[:page], per_page: 10)
    else
      @projects = Project.includes(:organization).filter(filterable_params).where(public: true).paginate(page: params[:page], per_page: 10)
    end
    @categories = Category.all.group_by { |category| category.cat_type }
  end

  # GET /projects/1
  def show
    if request.referrer
      flash[:notice] = %Q[<a href="#{request.referrer}">Go back to browse projects</a>] if request.referrer.split('/').include?('registries')
    end
  end

  def select
    unless current_user
      session[:project_slug] = params[:url_slug]
      redirect_to sign_in_path
    else
      current_user.registry.projects << set_project if current_user.registry && current_user.registry.projects.empty?
      redirect_to finishing_registry_form_path(current_user.registry)
    end
  end


  # GET /projects/new
  def new
    @organization = Organization.find(params[:organization_id])
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  def create
    @organization = Organization.find(params[:organization_id])
    @project = @organization.projects.new(project_params)

    if @project.save
      redirect_to current_user ? @organization : projects_thank_you_path
    else
      render 'new'
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

  def thank_you
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find_by(url_slug: params[:url_slug])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(
        :name,
        :partner,
        :description,
        :url_slug,
        :banner_img,
        :city,
        :country,
        :funding_goal,
        :closed_at,
        :public,
        :organization_id,
        :created_at,
        :updated_at,
        :project_photo,
        :project_photo_2,
        :project_photo_3,
        :extra_content,
        :contact_name,
        :contact_email,
        :contact_phone_number,
        :sector,
        :overview,
        :problem,
        :solution,
        :how_it_works_step1,
        :how_it_works_step2,
        :how_it_works_step3,
        :how_it_works_step4,
        :how_it_works_step5,
        :importance,
        :sustainability,
        :staff_quote,
        :photo1,
        :photo2,
        :photo3,
        :photo4,
        :photo5,
        :certified,
        :budget
      )
    end

    def filterable_params
      { :in_category => params[:categories] }
    end
end
