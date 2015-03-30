class MarketingController < ApplicationController

  layout 'full_width'

  def index
  end

  def show
    page_name = params[:footer_url].downcase
    if(page_name == "faq")
      render :show_faq
    elsif(page_name == "our-mission")
      render :show_our_mission
    elsif(page_name == "our-team")
      render :show_our_team
    elsif(page_name == "partner-with-us")
      render :show_partner_with_us
    elsif(page_name == "our-partners")
      render :show_our_partners
    elsif(page_name == "privacy-policy")
      render :show_privacy_policy
    elsif(page_name == "terms-of-use")
      render :show_terms_of_use
    end
  end
end