class PartnerInvite < ActiveRecord::Base

  attr_accessor :invitation_token
  include TokenAuthenticatable

  before_create :set_invitation_digest

  belongs_to :registry

  validates_presence_of :registry_id

  # first name, last name, email validation is in a reusable concern
  include Personable

  ############
  ## SCOPES ##
  ############

  default_scope ->{ where(:accepted_at => nil, :invalidated_at => nil) }
  scope :accepted, ->{ unscoped.where.not(:accepted_at => nil) }
  scope :invalidated, ->{ unscoped.where.not(:invalidated_at => nil) }

  ###################
  ## CLASS METHODS ##
  ###################

  ######################
  ## INSTANCE METHODS ##
  ######################

  def accepted?
     self.accepted_at?
  end

  def invalidated?
     self.invalidated_at?
  end

  def invalidate
    update(:invalidated_at => Time.zone.now)
  end

  def send_invite_email
    UserMailer.partner_invitation(self).deliver!
  end

  def set_invitation_digest
    self.invitation_token  = User.new_token
    self.invitation_digest = User.digest(invitation_token)
  end

end

# == Schema Information
#
# Table name: partner_invites
#
#  id                :integer          not null, primary key
#  first_name        :string(255)      not null
#  last_name         :string(255)      not null
#  email             :string(255)      not null
#  registry_id       :integer          not null
#  invitation_digest :string(128)
#  accepted_at       :datetime
#  invalidated_at    :datetime
#  created_at        :datetime
#  updated_at        :datetime
#
