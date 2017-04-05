class CelebrationsController < ApplicationController

  def show
    @registry = Celebration.find_by(:url_slug => params[:url_slug].downcase)
  end

  def update
    @registry = Celebration.find_by(:url_slug => celebration_params[:url_slug].downcase)
    project_url_slug = params.delete(:project_url_slug)
    if @registry.update(celebration_params)
      if project_url_slug.present?
        new_projects = [Project.find_by(url_slug: project_url_slug)]
        @registry.projects.replace(new_projects)
      end
      respond_to do |format|
        format.html { redirect_to project_registry_form_path(@registry) }
        format.json { render json: {finished_url: finished_registry_path(@registry)}.to_json }
      end
    else
      redirect_to :edit, notice: 'There was an error updating your registry. Please try again.'
    end
  end

  private

  def celebration_params
    params.require(:celebration).permit(
      :name,
      :type,
      :registrant_first_name,
      :registrant_last_name,
      :partner_first_name,
      :partner_last_name,
      :url_slug,
      :city_state,
      :banner_image,
      :profile_image,
      :event_date,
      :couples_story,
      :registry_story,
      :goal,
      :video_url,
      :event_type
    )
  end
end