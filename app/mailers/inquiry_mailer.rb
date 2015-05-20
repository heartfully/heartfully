class InquiryMailer < ActionMailer::Base
  def notify_admin(inquirer)
    @inquirer = inquirer
    mail to: 'kate@heartful.ly, corey@heartful.ly', subject: "New Inquiry - #{@inquirer.name}"
  end
end