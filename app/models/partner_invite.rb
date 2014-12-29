# == Schema Information
#
# Table name: partner_invites
#
#  id          :integer          not null, primary key
#  email       :string(255)
#  registry_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class PartnerInvite < ActiveRecord::Base
  belongs_to :registry

  validates_presence_of :email, :registry_id

  def self.send_invite(params = {})
    if (partner_invite = PartnerInvite.create(params))
      UserMailer.partner_invitation(partner_invite).deliver!
    else
      false
    end
  end
end
