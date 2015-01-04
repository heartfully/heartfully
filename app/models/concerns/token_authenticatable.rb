module TokenAuthenticatable
  extend ActiveSupport::Concern

  included do
    def authenticate_by(auth_type, token, options = {})
      db_suffix = options[:db_suffix] || "_digest"
      digest = self.send("#{auth_type}#{db_suffix}")
      return false if digest.nil?
      BCrypt::Password.new(digest).is_password?(token)
    rescue
      false
    end
  end

  module ClassMethods
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

end