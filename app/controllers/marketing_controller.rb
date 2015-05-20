class MarketingController < ApplicationController

  layout 'full_width'

  def index
  end

  def about_us
  end
  
  def new_inquiry
    @inquirer = Inquirer.new
  end

  def create_inquiry
    @inquirer = Inquirer.new(inquiry_params)
    
  end

  def faq
  end

  def partner_with_us
  end

  def our_partners
  end

  def privacy_policy
  end
  
  def terms_of_use
  end

  private
  def inquiry_params
    params.require(:inquirer).permit(:name, :partner_name, :email,
                                     :phone, :preferred_contact_method, :message)
  end
end