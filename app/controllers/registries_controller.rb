class RegistriesController < ApplicationController
  before_action :require_auth, :only => [:create, :edit, :update, :destroy]
  before_action :set_registry, :only => [:edit, :update, :destroy]

  # GET /registries/:url_slug
  def show
    @registry = Registry.find_by(:url_slug => params[:url_slug])
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registry
      @registry = current_user.registry
      redirect_to new_registry_path unless @registry.present?
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
