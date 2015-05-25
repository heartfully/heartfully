# == Schema Information
#
# Table name: inquirers
#
#  id                       :integer          not null, primary key
#  name                     :string(255)
#  partner_name             :string(255)
#  email                    :string(255)
#  preferred_contact_method :string(255)
#  phone                    :string(255)
#  message                  :text
#  created_at               :datetime
#  updated_at               :datetime
#

class Inquirer < ActiveRecord::Base
  validates_presence_of :name, :email

  def clean_contact_method(options)
    string = ''
    options.each do |method, value|
      string += "#{method} " if value.to_i == 1
    end
    self.preferred_contact_method = string
  end
end
