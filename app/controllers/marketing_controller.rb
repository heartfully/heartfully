class MarketingController < ApplicationController

  def index
    if current_user
      cookies[:hide_sub_modal] = 1
      slug = current_user.registry.try(:url_slug)
      redirect_to slug ? registry_admin_path(slug) : user_path(current_user)
    end
    @projects = Project.where(public: true).limit(4).order("RANDOM()")
  end

  def birthdays
    @birthdays = Birthday.where(url_slug: ["jasonnellis", "carols-turning-70", "nickiandnadav31"])
    @birthdays += Birthday.where('event_date > ?', Date.today).order("RANDOM()").limit(3 - @birthdays.length)
    @projects = Project.where(public: true).limit(3).order("RANDOM()")
    @reminder = Reminder.new
  end

  def how_it_works
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

  def press
  end

  def email_subscription
    name = params[:name].split(" ")
    first_name = name.first
    last_name = name.last
    # TODO: put this in a background job
    gibbon = Gibbon::Request.new
    begin
      gibbon.lists("767e0539d0").members.create(body: {email_address: params[:email], status: "subscribed", merge_fields: {FNAME: first_name, LNAME: last_name}})
    rescue
    end
    head :ok
  end

  private
  def inquiry_params
    params.require(:inquirer).permit(:name, :partner_name, :email,
                                     :phone, :preferred_contact_method, :message)
  end
end
