class OrganizationMailer < ActionMailer::Base
  default from: "hello@heartful.ly"
  
	def notify_admin(organization)
		@organization = organization
		mail to: 'partnerships@heartful.ly, alex@heartful.ly', subject: "New Org Application - id: #{@organization.id}"
	end
end