class RegistriesController < ApplicationController
  before_action :require_auth, :only => [:create, :edit, :update, :destroy]
  before_action :set_registry, :only => [:edit, :update, :destroy]
  before_action :find_by_slug, :only => [:show, :projects]

  # GET /registries/:url_slug
  def show
    if(params[:url_slug].downcase == "peterandeva")
      render :show_peter_and_eva
    # elsif(params[:url_slug].downcase == "wangama")
    #   render :show_katelyn_and_brandon
    # elsif(params[:url_slug].downcase == "marissaandtravis")
    #   render :show_marissa_and_travis
    elsif(params[:url_slug].downcase == "lindseyandmatt")
      render :show_lindsey_and_matt
    elsif(params[:url_slug].downcase == "sample")
      @registry = Registry.find_by(:url_slug => "lindseyandmatt")
      render :show_sample
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
      redirect_to projects_path , notice: 'Please select a project'
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

  def sample_show 
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
        :banner_img,
        :profile_img,
        :description,
        :address_1,
        :address_2,
        :city,
        :state,
        :postal_code,
        :country,
        :banner_image,
        :profile_image
      )
    end
end
