class RegistriesController < ApplicationController
  before_action :require_auth, :only => [:create, :edit, :update, :destroy]
  before_action :set_registry, :only => [:edit, :update, :destroy]
  before_action :find_by_slug, :only => [:show, :projects]
  
  layout 'registry_layout'
  # GET /registries/:url_slug
  def show
    @order = Order.new
    if(params[:url_slug] == "PeterandEva")
      render :show_peter_and_eva
    elsif(params[:url_slug] == "wangama")
      render :show_katelyn_and_brandon
    elsif(params[:url_slug] == "marissaandtravis") 
      render :show_marissa_and_travis
    elsif(params[:url_slug] == "LindseyandMatt")
      render :show_lindsey_and_matt  
    end
  end

  # GET /registries/new
  def new
    @registry = Registry.new
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
      redirect_to edit_registry_path, notice: 'Registry was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /registries/1
  def update
    if @registry.update(registry_params)
      redirect_to @registry, notice: 'Registry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /registries/1
  def destroy
    @registry.destroy
    redirect_to registries_url, notice: 'Registry was successfully destroyed.'
  end

  def projects
    if request.post?
      RegistryProject.where(registry_id: @registry.id, project_id: params[:project_id].to_i).first.approve!
      redirect_to "/registry/#{@registry.url_slug}"
    else
      redirect_to "/registry/#{@registry.url_slug}" if current_user.nil? || !current_user.system_admin
      @projects = @registry.approved_projects.empty? ? @registry.projects : @registry.approved_projects
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registry
      @registry = current_user.registry
      redirect_to new_registry_path unless @registry.present? 
    end

    def find_by_slug
      @registry = Registry.find_by(:url_slug => params[:url_slug])
    end

    # Only allow a trusted parameter "white list" through.
    def registry_params
      params.require(:registry).permit(
        :name,
        :url_slug,
        :banner_img,
        :profile_img,
        :description,
        :address_1,
        :address_2,
        :city,
        :state,
        :postal_code,
        :country
      )
    end
end
