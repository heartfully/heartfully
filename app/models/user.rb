class User < ActiveRecord::Base

  ################
  ## ATTRIBUTES ##
  ################

  attr_accessor :confirmation_token, :reset_token, :remember_token
  # Methods to authenticate a model by a hashed token value
  include TokenAuthenticatable

  ####################
  ## AUTHENTICATION ##
  ####################

  has_secure_password

  ###############
  ## CALLBACKS ##
  ###############

  before_create :set_confirmation_digest
  before_save :downcase_email, :if => Proc.new { |user| user.email_changed? }

  ###################
  ## RELATIONSHIPS ##
  ###################

  belongs_to :registry
  has_and_belongs_to_many :guest_registries, :class_name => "Registry", :join_table => "guests_registries", :foreign_key => "guest_id"
  belongs_to :organization

  ############
  ## SCOPES ##
  ############

  #################
  ## VALIDATIONS ##
  #################

  validates_presence_of :password_digest
  validates :password, length: { minimum: 8 }, :allow_nil => true
  validates_uniqueness_of :email
  # first name, last name, email validation is in a reusable concern
  include Personable

  ###################
  ## CLASS METHODS ##
  ###################

  ######################
  ## INSTANCE METHODS ##
  ######################

  def partner
    if self.registry_id
      User.where(:registry_id => self.registry_id).where.not(:id => self.id).first
    else
      User.none
    end
  end

  def confirm
    update_attribute(:confirmed_at, Time.zone.now) if !confirmed?
  end

  def confirmed?
    self.confirmed_at?
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Drop the remember digest
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

  def downcase_email
    self.email.downcase!
  end

  def set_confirmation_digest
    self.confirmation_token  = User.new_token
    self.confirmation_digest = User.digest(confirmation_token)
  end

end

# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string(255)      not null
#  password_digest     :string(128)      not null
#  remember_digest     :string(128)
#  reset_digest        :string(128)
#  reset_sent_at       :datetime
#  confirmation_digest :string(128)
#  confirmed_at        :datetime
#  first_name          :string(255)      not null
#  last_name           :string(255)      not null
#  profile_img         :string(255)
#  registry_id         :integer
#  organization_id     :integer
#  system_admin        :boolean          default(FALSE), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
