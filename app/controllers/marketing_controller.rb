class MarketingController < ApplicationController

  def index
    if current_user
      slug = current_user.registry.try(:url_slug)
      redirect_to slug ? registry_admin_path(slug) : user_path(@user)
    end
    @projects = Project.where(public: true).limit(4).order("RANDOM()")
  end

  def about_us
  end

  def new_inquiry
    @inquirer = Inquirer.new
  end

  def create_inquiry
    @inquirer = Inquirer.new(inquiry_params)
    @inquirer.clean_contact_method(params[:inquirer][:preferred_contact_method])
    if @inquirer.save
      InquiryMailer.notify_admin(@inquirer).deliver!
    else
      render 'new_inquiry'
    end
  end

  def faq
  end

  def partner_with_us
  end

  def our_partners
    @partners = Organization.where(heartfully_approved: true).order('name ASC')
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
