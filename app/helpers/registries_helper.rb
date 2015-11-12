module RegistriesHelper

  def require_registry
    if current_user.registry.nil?
      redirect_to new_registry_path, :notice => "You need to create a registry first!"
    end
  end

  def approved_project?(registry, project)
    RegistryProject.where(:registry_id => registry.id, :project_id => project.id).first.approved
  end
end
