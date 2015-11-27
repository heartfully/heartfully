class RegistriesController < ApplicationController
  before_action :require_auth, :only => [:create, :edit, :update, :destroy,
                                         :admin]
  before_action :set_registry, :only => [:edit, :update, :destroy, :admin]
  before_action :find_by_slug, :only => [:show, :projects]

  # GET /registry/:url_slug
  def show
  end

  # GET /registries/new
  def new
    if !current_user
      redirect_to new_user_path
    else
      redirect_to registry_home_path(current_user.registry.url_slug) if current_user.registry
      @registry = Registry.new
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
    if @registry.update(registry_params)
      redirect_to "/registry/#{@registry.url_slug}", notice: 'Registry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /registries/1
  def destroy
    @registry.destroy
    redirect_to registries_url, notice: 'Registry was successfully destroyed.'
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
    @registry = Registry.find(params[:id])
    @projects = Project.where(public: true)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registry
      @registry = current_user.registry
      redirect_to new_registry_path unless @registry.present?
    end

    def find_by_slug
      @registry = Registry.find_by(:url_slug => params[:url_slug].downcase)
    end

    # Only allow a trusted parameter "white list" through.
    def registry_params
      params.require(:registry).permit(
        :name,
        :url_slug,
        :description,
        :city_state,
        :banner_image,
        :profile_image,
        :wedding_date,
        :couples_story,
        :registry_story
      )
    end
end
