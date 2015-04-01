require_relative("./item_stuff/marissaandtravis_items")
require_relative("./item_stuff/peterandeva_items")
require_relative("./item_stuff/katelynandbrandon_items")
require_relative("./item_stuff/lyndseyandmatt_items")

Registry.destroy_all
registries = Registry.create([
  { :name => "Peter and Eva", :url_slug => "peterandeva", :postal_code => "20005" },
  { :name => "Katelyn and Brandon", :url_slug => "wangama", :postal_code => "20005"},
  { :name => "Marissa and Travis", :url_slug => "marissaandtravis", :postal_code => "20005"},
  { :name => "Lindsey and Matt", :url_slug => "lindseyandmatt", :postal_code => "20005" }
])

User.destroy_all
users = User.create([
#   { :email => "mike@fink.com", :password => "jetsrule", :first_name => "Mike", :last_name => "Fink", :registry_id => registries.first.id },
#   { :email => "megan@fink.com", :password => "lilabeast", :first_name => "Megan", :last_name => "Fink", :registry_id => registries.first.id },
#   { :email => "seans887@gmail.com", :password => "password", :first_name => "Sean", :last_name => "Shannon" },
  { :email => "cspeisman@gmail.com", :password => "password", :first_name => "Corey", :last_name => "Speisman", :system_admin => true }
])

Organization.destroy_all
orgs = Organization.create([
  { :name => 'Heartfully', :admin_id => users.first.id }
])

Project.destroy_all
projects = Project.create([
  # "Peter and Eva"
  { name: "EcoSac women’s entrepreneurship training", headline: "EcoSac Women's Entrepreneurship Training", :organization_id => orgs.first.id, :country => "Senegal" },
  # "Katelyn and Brandon"
  { name: "Complete Wangama's Clinic", headline: "Build Wangama's Health Clinic", :organization_id => orgs.first.id, :country => "Tanzania" },
  # "Marissa and Travis"
  { name: 'Light up the night solar energy campaign', headline: "Light up the Night in Zambia", :organization_id => orgs.first.id, :country => "Zambia" },
  # "Lindsey and Matt"
  { name: "Home-Based Care Program", headline: "Healthworker training", :organization_id => orgs.first.id, :country => "Tanzania" }
])


4.times do |num|
  registries[num].projects << projects[num]
  RegistryProject.where(registry_id: registries[num].id, project_id: projects[num].id).first.approve!
end

# registry = Registry.find_by_url_slug('coreys-registry')
# User.find_by_email('cspeisman@gmail.com').registry = registry

# registry.projects = Project.all
marrissa_and_travis_items
peter_and_eva_items
katelyn_and_brandon_items
lyndsey_and_matt_items

Category.destroy_all
categories = Category.create([
  { :name => "Africa", :cat_type => "region" },
  { :name => "Asia", :cat_type => "region" },
  { :name => "South America", :cat_type => "region" },
  { :name => "Clean Water", :cat_type => "issue" },
  { :name => "Education", :cat_type => "issue" },
  { :name => "Healthcare", :cat_type => "issue" },
  { :name => "Microlending", :cat_type => "issue" }
])

ProjectCategory.destroy_all
ProjectCategory.create([
  { :project => projects.first, :category => categories.first },
  { :project => projects.first, :category => categories.fourth },
  { :project => projects.second, :category => categories.second },
  { :project => projects.second, :category => categories.fifth },
  { :project => projects.third, :category => categories.first },
  { :project => projects.third, :category => categories.last },
  { :project => projects.fourth, :category => categories.third },
  { :project => projects.fourth, :category => categories.last }
])

# RegistryProject.create([
#   { :registry_id => registries.first.id, :project_id => projects.first.id }
# ])
#
# item_types = ItemType.create([
#   { :name => "Shovel", :price => 20.99, :project_id => projects.first.id },
#   { :name => "Bag of cement", :price => 40.00, :project_id => projects.first.id },
#   { :name => "Filter", :price => 100.00, :project_id => projects.first.id }
# ])
#
# purchases = Purchase.create([
#   { :user_id => users.last.id }
# ])
#
