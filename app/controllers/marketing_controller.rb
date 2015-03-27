class MarketingController < ApplicationController

  layout 'full_width'

  def index
  end

  def show
    if(params[:footer_url].downcase == "faq")
      render :show_faq
    elsif(params[:footer_url].downcase == "our-mission")
      render :show_our_mission
    elsif(params[:footer_url].downcase == "our-team")
      render :show_our_team
    elsif(params[:footer_url].downcase == "how-it-works")
      render :show_how_it_works
    elsif(params[:footer_url].downcase == "partner-with-us")
      render :show_partner_with_us
    elsif(params[:footer_url].downcase == "our-partners")
      render :show_our_partners
    end
  end
end