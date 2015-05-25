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

require 'rails_helper'

RSpec.describe Inquirer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
