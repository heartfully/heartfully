class RegistriesController < ApplicationController
  before_action :authenticate_user!, :except => [:show]
  before_action :set_registry, :only => [:show, :edit, :update, :destroy]

  # GET /registries
  def index
    @registries = Registry.all
  end

  # GET /registries/1
  def show
  end

  # GET /registries/new
  def new
    @registry = Registry.new
  end

  # GET /registries/1/edit
  def edit
  end

  # POST /registries
  def create
    @registry = Registry.new(registry_params)

    if @registry.save
      redirect_to @registry, notice: 'Registry was successfully created.'
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
      @registry = Registry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def registry_params
      params[:registry]
    end
end
