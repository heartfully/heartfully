class ProjectDecorator < Draper::Decorator
  delegate_all
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def profile_photo
    object.profile_img? || "http://www.clker.com/cliparts/f/n/o/m/6/C/transparent-heart.svg"
  end

end
