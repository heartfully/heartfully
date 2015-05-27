class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  def index
    @organizations = Organization.all
    authorize! :read, @organizations
  end

  # GET /organizations/1
  def show
    authorize! :read, @organization
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      OrganizationMailer.notify_admin(@organization).deliver!
    else
      render :new
    end
  end

  # PATCH/PUT /organizations/1
  def update
    if @organization.update(organization_params)
      redirect_to @organization, notice: 'Organization was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /organizations/1
  def destroy
    @organization.destroy
    redirect_to organizations_url, notice: 'Organization was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def organization_params
      params.require(:organization).permit(
        :name,
        :org_url,
        :in_price_range,
        :sectors,
        :mission_statement,
        :tax_exempt,
        :city_province,
        :country,
        :annual_budget,
        :ranked_charity,
        :referral_source,
        :entity_if_not_503,
        :contact_name,
        :contact_job_title,
        :contact_email,
        :contact_phone_number,
        :heartfully_approved
      )
    end
end
