class InquiryMailer < ActionMailer::Base
  default from: "concierge@heartful.ly"
  
  def notify_admin(inquirer)
    @inquirer = inquirer
    mail to: 'kate@heartful.ly, corey@heartful.ly', subject: "New Inquiry - #{@inquirer.name}"
  end
end
