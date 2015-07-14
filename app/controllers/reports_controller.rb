class ReportsController < ApplicationController
  def new
    @organization = Organization.find(params[:organization_id])
  end

  def show
    @report = Report.find(params[:id])
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @report = @organization.reports.create(report_params)
    redirect_to organization_path(@organization)
  end

  private

  def report_params
    params.require(:report).permit(
      :number_of_benefitters,
      :number_of_communities_served,
      :number_of_trainings_complete,
      :number_of_buildings_constructed,
      :other_benefits,
      :impact_measurement,
      :forward_steps,
      :thank_you_message,
      :photo1,
      :photo2,
      :photo3,
      :photo4,
      :photo5
    )
  end
end
