class User < ActiveRecord::Base

  ################
  ## ATTRIBUTES ##
  ################

  attr_accessor :confirmation_token, :reset_token, :remember_token

  ####################
  ## AUTHENTICATION ##
  ####################

  has_secure_password

  ###############
  ## CALLBACKS ##
  ###############

  before_create :create_confirmation_digest
  before_save :downcase_email, :if => Proc.new { |user| user.email_changed? }

  ###################
  ## RELATIONSHIPS ##
  ###################

  belongs_to :couple
  has_one :registry, :through => :couple
  has_and_belongs_to_many :guest_registries, :class_name => "Registry", :join_table => "guests_registries", :foreign_key => "guest_id"
  belongs_to :organization

  #################
  ## VALIDATIONS ##
  #################

  validates_presence_of :email, :password_digest, :first_name, :last_name
  validates :password, length: { minimum: 8 }, :allow_nil => true
  validates :first_name, length: { maximum: 50 }
  validates :first_name, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  ###################
  ## CLASS METHODS ##
  ###################

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  ######################
  ## INSTANCE METHODS ##
  ######################

  def confirm
    update_attribute(:confirmed_at, Time.zone.now) if !confirmed?
  end

  def confirmed?
    self.confirmed_at?.present?
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest => User.digest(remember_token))
  end

  def authenticate_by(auth_type, token)
    digest = self.send("#{auth_type}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  rescue
    false
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

  def create_confirmation_digest
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
#  confirmation_digest :string(128)
#  confirmed_at        :datetime
#  first_name          :string(255)      not null
#  last_name           :string(255)
#  profile_img         :string(255)
#  couple_id           :integer
#  organization_id     :integer
#  system_admin?       :boolean          default(FALSE), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
