class InquiryMailer < ActionMailer::Base
  default from: "hello@heartful.ly"
  
  def notify_admin(inquirer)
    @inquirer = inquirer
    mail to: 'kate@heartful.ly, alex@heartful.ly', subject: "New Inquiry - #{@inquirer.name}"
  end
end
