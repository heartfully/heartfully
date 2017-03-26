namespace :import do

  desc "Import projects and organizations from GlobalGiving"
  task :global_giving, [:next_project_id] => :environment do |t, args|
    puts "Starting task"
    fetch_regions
    fetch_themes
    fetch_project_data(args.next_project_id)
    puts "Done!"
  end

  def fetch_regions
    target = "https://api.globalgiving.org/api/public/projectservice/regions.json?api_key=#{ENV['GLOBAL_GIVING_API_KEY']}"
    uri = URI.parse(target)
    response = Net::HTTP.get_response(uri)
    response_json = JSON.parse(response.body)
    puts "Importing regions..."
    response_json["regions"]["region"].each do |region|
      Category.find_or_create_by(name: region["name"], cat_type: "region")
    end
  end

  def fetch_themes
    target = "https://api.globalgiving.org/api/public/projectservice/themes.json?api_key=#{ENV['GLOBAL_GIVING_API_KEY']}"
    uri = URI.parse(target)
    response = Net::HTTP.get_response(uri)
    response_json = JSON.parse(response.body)
    puts "Importing themes..."
    response_json["themes"]["theme"].each do |theme|
      Category.find_or_create_by(name: theme["name"], cat_type: "issue")
    end
  end

  def fetch_project_data(next_project_id = nil)
    target = "https://api.globalgiving.org/api/public/projectservice/all/projects/active.json?api_key=#{ENV['GLOBAL_GIVING_API_KEY']}"
    target += "&nextProjectId=#{next_project_id}" if next_project_id

    uri = URI.parse(target)
    response = Net::HTTP.get_response(uri)
    response_json = JSON.parse(response.body)
    puts "Importing projects...next project id is #{next_project_id}"
    import_projects(response_json["projects"]["project"])
    fetch_project_data(response_json["projects"]["nextProjectId"]) if response_json["projects"]["hasNext"]
  end

  def import_projects(projects_json)
    projects_json.each do |project_json|
      import_project(project_json)
    end
  end

  def import_project(project_json)
    return if we_dont_want_this_project(project_json)

    organization = find_or_import_organization(project_json["organization"])
    project = Project.find_or_initialize_by(source_id: project_json["id"])
    project_params = {}
    project_params[:name] = project_json["title"]
    project_params[:partner] = organization.name
    project_params[:overview] = project_json["summary"]
    project_params[:description] = project_json["summary"]
    project_params[:url_slug] = project_json["projectLink"].match(/projects\/([^\/]*)/)[1]
    project_params[:city] = project_json["contactCity"]
    project_params[:country] = project_json["contactCountry"]
    project_params[:funding_goal] = project_json["remaining"]
    project_params[:project_photo] = project_json["image"]["imagelink"].select{|i| i["size"] == "large"}.first["url"]
    project_params[:problem] = project_json["need"]
    project_params[:solution] = project_json["activities"]
    project_params[:sustainability] = project_json["longTermImpact"]
    project_params[:organization_id] = organization.id
    project.update_attributes!(project_params)

    region = Category.where(name: project_json["region"], cat_type: "region").first_or_create
    project.categories << region unless project.categories.where(id: region.id).exists?

    country = Category.where(name: project_json["country"], cat_type: "region").first_or_create
    project.categories << country unless project.categories.where(id: country.id).exists?

    issue = Category.where(name: project_json["themeName"], cat_type: "issue").first_or_create
    project.categories << issue unless project.categories.where(id: issue.id).exists?

    create_item_types(project, project_json["donationOptions"]["donationOption"])
  end

  def find_or_import_organization(organization_json)
    organization = Organization.find_or_initialize_by(source_id: organization_json["id"])
    organization_params = {}
    organization_params[:name] = organization_json["name"]
    organization_params[:description] = organization_json["mission"]
    organization_params[:profile_img] = organization_json["logoUrl"]
    organization_params[:org_url] = organization_json["url"]
    organization_params[:admin_id] = admin_id
    if organization_json["themes"]["theme"]
      organization_params[:sectors] = organization_json["themes"]["theme"].map{|t| t["name"]}.join(",")
    else
      puts "Organization #{organization_json["id"]} has no themes!"
    end
    organization_params[:tax_exempt] = true
    organization_params[:city_province] = organization_json["city"] + ", " + organization_json["state"]
    organization_params[:country] = organization_json["country"]
    organization.update_attributes!(organization_params)
    organization
  end

  def create_item_types(project, donation_options)
    project.item_types.destroy_all
    donation_options.each do |option|
      project.item_types.build(name: option["description"], price: option["amount"])
    end
    begin
      project.save!
    rescue Exception => e
      puts "Project #{project.source_id} had some problems creating item types"
    end
  end

  def admin_id
    @admin_id ||= User.find_by_email("aleach84@gmail.com").id
  end

  # if it's not a project, has less than 1500 remaining in the funding goal,
  # has fewer than 4 item types, or has fewer than 3 item types 100 or under
  def we_dont_want_this_project(project_json)
    project_json["type"] != "project" ||
    project_json["remaining"].to_f < 1500 ||
    project_json["donationOptions"]["donationOption"].length < 4 ||
    project_json["donationOptions"]["donationOption"].select{|option| option["amount"].to_i <= 100}.length < 3
  end
end