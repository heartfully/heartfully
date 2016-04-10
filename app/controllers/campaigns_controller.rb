class CampaignsController < ApplicationController
  before_action :find_by_slug

  def show
  end

  private
  def find_by_slug
    @registry = Campaign.find_by(:url_slug => params[:url_slug].downcase)
  end
end
