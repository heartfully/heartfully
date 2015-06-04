class OrganizationMailer < ActionMailer::Base
  default from: "concierge@heartful.ly"
  
	def notify_admin(organization)
		@organization = organization
		mail to: 'partnerships@heartful.ly, corey@heartful.ly', subject: "New Org Application - id: #{@organization.id}"
	end
end