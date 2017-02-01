module RegistriesHelper

  def require_registry
    if current_user.registry.nil?
      redirect_to new_registry_path, :notice => "You need to create a registry first!"
    end
  end

  def approved_project?(registry, project)
    RegistryProject.where(:registry_id => registry.id, :project_id => project.id).first.approved
  end

  def path_for(registry)
    registry.is_a?(Birthday) ? birthday_home_path(registry.url_slug) : registry_home_path(registry.url_slug)
  end

  def goal_message_for(registry)
    registry.is_a?(Birthday) ? "My fundraising goal" : "Our fundraising goal"
  end

  def facebook_share_link_for(registry)
    if registry.url_slug == "valentinesday"
      link_to image_tag('facebook.png', width: "50px"), "#", class: "shareRegistry", data: {registry: valentinesday_url}
    elsif registry.is_a?(Birthday)
      link_to image_tag('facebook.png', width: "50px"), "#", class: "shareRegistry", data: {registry: birthday_home_url(@registry.url_slug)}
    else
      link_to image_tag('facebook.png', width: "50px"), "#", class: "shareRegistry", data: {registry: registry_home_url(@registry.url_slug)}
    end
  end

  def twitter_share_link_for(registry)
    if registry.url_slug == "valentinesday"
      link_to image_tag('twitter.png', width: "50px"), "https://twitter.com/intent/tweet?text=Celebrate %23valentinesday with a donation to @mercycorps and their assistance to %23syrianrefugees&url=#{valentinesday_url}&via=Heartful_ly"
    elsif registry.is_a?(Birthday)
      link_to image_tag('twitter.png', width: "50px"), "https://twitter.com/intent/tweet?text=Celebrate #{@registry.reference_name}'s big day with a donation to #{@registry.projects.first.organization.name}&url=#{birthday_home_url(@registry.url_slug)}&via=Heartful_ly"
    else
      link_to image_tag('twitter.png', width: "50px"), "https://twitter.com/intent/tweet?text=Celebrate #{CGI.escape @registry.display_name}'s registry with a donation to support #{@registry.projects.first.organization.name}&url=#{registry_home_url(@registry.url_slug)}&via=Heartful_ly"
    end
  end

  def gift_items_display_for(registry)
    if registry.url_slug == "valentinesday"
      "Dedicate a Valentine’s Day gift"
    elsif registry.is_a?(Birthday)
      name = registry.registrant_first_name
      name.present? ? "#{name}'s birthday wishlist" : "birthday wishlist"
    else
      "Registry Gift Items"
    end
  end
end
