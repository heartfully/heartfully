module Personable
  extend ActiveSupport::Concern

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  included do
    # validates_presence_of :first_name, :last_name, :email
    # validates :first_name, length: { maximum: 50 }
    # validates :last_name, length: { maximum: 50 }
    validates_presence_of :email
    validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  end

end