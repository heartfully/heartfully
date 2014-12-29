module UsersHelper

  def user_avatar(user)
    if user.profile_img.present?
      user.profile_img
    else
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=75"
    end
  end

end
