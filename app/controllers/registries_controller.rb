class RegistriesController < ApplicationController
  before_action :require_auth, :only => [:create, :edit, :update, :destroy,
                                         :admin]
  before_action :set_registry, :only => [:edit, :update, :destroy, :admin]
  before_action :confirm_project, :only => [:admin]
  before_action :find_by_slug, :only => [:show, :projects]
  before_filter :prevent_caching, :only => [:new]

  # GET /registry/:url_slug
  def show
    if @registry
      if @registry.type
        redirect_to campaign_home_path(@registry.url_slug) if @registry.type.downcase == "campaign"
        redirect_to birthday_home_path(@registry.url_slug) if @registry.type.downcase == "birthday"
      end
      redirect_to project_registry_form_path(@registry) if @registry.projects.empty?
    else
      redirect_to root_path
    end
  end

  # GET /registries/new
  def new
    if !current_user
      redirect_to new_user_path
    else
      @registry = current_user.registry if current_user.registry
      @registry ||= Registry.new
    end
  end

  # GET /registries/1/edit
  def edit
    if current_user.partner
      @partner = current_user.partner
    else
      @partner_invite = PartnerInvite.find_or_initialize_by(:registry_id => @registry.id)
    end
  end

  # POST /registries
  def create
    @registry = Registry.new(registry_params)
    if @registry.save
      current_user.update(:registry_id => @registry.id)
      redirect_to project_registry_form_path(@registry)
    else
      render :new
    end
  end

  # PATCH/PUT /registries/1
  def update
    if params.has_key?(:done) && @registry.update(registry_params)
      redirect_to registry_admin_path(@registry.url_slug), notice: 'Registry was successfully updated.'
    elsif @registry.update(registry_params)
      redirect_to project_registry_form_path(@registry)
    else
      redirect_to :back, notice: 'There was an error updating your registry. Please try again.'
    end
  end

  # DELETE /registries/1
  def destroy
    @registry.destroy
    redirect_to user_path(current_user), notice: 'Registry was successfully destroyed.'
  end

  # GET /registry/:url_slug/admin
  def admin
    # allow system admins to see admin page for a registry with any slug
    find_by_slug if current_user.system_admin?

    @project = @registry.projects.first
    @orders = @registry.orders.complete
  end

  def sample_show
    @registry = Registry.find(37)
  end

  def project_registry_form
    @categories = Category.all.group_by { |category| category.cat_type }
    @registry = Registry.find(params[:id])
    if params[:search].present?
      @projects = Project.includes(:organization).search_by_lots_of_fields(params[:search]).where(public: true).paginate(page: params[:page], per_page: 10)
    else
      @projects = Project.includes(:organization).filter(filterable_params).where(public: true).paginate(page: params[:page], per_page: 10)
    end
  end

  def finishing_registry_form
    @registry = Registry.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registry
      @registry = current_user.registry
      redirect_to new_registry_path unless @registry.present?
    end

    def confirm_project
      @registry = current_user.registry
      @project = current_user.registry.projects.first
      unless @project.present?
        redirect_to project_registry_form_path(@registry), notice: "You must first choose a project"
      end
    end

    def find_by_slug
      @registry = Registry.find_by(:url_slug => params[:url_slug].downcase)
    end

    # Only allow a trusted parameter "white list" through.
    def registry_params
      params.require(:registry).permit(
        :name,
        :url_slug,
        :city_state,
        :banner_image,
        :profile_image,
        :event_date,
        :couples_story,
        :registry_story
      )
    end

    def filterable_params
      { :in_category => params[:categories] }
    end

    def prevent_caching
      response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "0"
    end
end
