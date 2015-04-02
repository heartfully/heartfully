module RegistriesHelper

  def require_registry
    if current_user.registry.nil?
      redirect_to new_registry_path, :notice => "You need to create a registry first!"
    end
  end

  def calc_percentage(registry)
    ((registry.approved_projects.first.total_cost('purchased').to_f / registry.approved_projects.first.total_cost.to_f) * 100).round(0)
  end
  def approved_project?(registry, project)
    RegistryProject.where(:registry_id => registry.id, :project_id => project.id).first.approved 
  end
end
