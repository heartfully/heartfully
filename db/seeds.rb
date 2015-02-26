Registry.destroy_all
registries = Registry.create([
  { :name => "Peter and Eva", :url_slug => "PeterandEva", :postal_code => "20005" },
  { :name => "Katelyn and Brandon", :url_slug => "wangama", :postal_code => "20005"},
  { :name => "Marissa and Travis", :url_slug => "marissaandtravis", :postal_code => "20005"},
  { :name => "Lindsey and Matt", :url_slug => "LindseyandMatt", :postal_code => "20005" }
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
  { :name => 'Solar Aid', :admin_id => users.first.id }
])

Project.destroy_all
projects = Project.create([
  { name: 'Solar Aid', headline: "Super Awesome project", :organization_id => orgs.first.id, :country => "Ghana" }
#   { :name => "EcoSac women’s empowerment training", :description => "The EcoSac women’s empowerment training will support women in Senegal to promote an affordable energy alternative that is not only more efficient and safer for family health, but is also an income generator for women leaders in the community.", },
#   { :name => "Build a Well in 1", :country => "Ghana", :organization_id => orgs.first.id  },
#   { :name => "Build a Well in 2", :country => "Ghana", :organization_id => orgs.first.id  },
#   { :name => "Build a Well in 3", :country => "Ghana", :organization_id => orgs.first.id  },
#   { :name => "Build a Well in 4", :country => "Ghana", :organization_id => orgs.first.id  },
#   { :name => "Build a Well in 5", :country => "Ghana", :organization_id => orgs.first.id  },
#   { :name => "Build a Well in 6", :country => "Ghana", :organization_id => orgs.first.id  },
#   { :name => "Build a Well in 7", :country => "Ghana", :organization_id => orgs.first.id  }
])
registries[2].projects << projects.first
RegistryProject.where(registry_id: registries[2].id, project_id: projects.first.id).first.approve!
item_types = projects.first.item_types.create([
  {:name => 'Meeting logistics', :description => '', :price => 60.00, :thumbnail_img => "marissa_and_travis/meeting_logistics.jpg"},
  {:name => 'Full participation package for a principal', :description => '' , :price => 100.00, :thumbnail_img => 'marissa_and_travis/full_participation_package.jpg'},
  {:name => 'Transportation of SolarAid trainers to rural communities', :description => '' , :price => 35.00, :thumbnail_img => "marissa_and_travis/transportation_of_sa_trainers.jpg"},
  {:name => 'Principal stipend for leading the school’s solar campaign', :description => '' , :price => 50.00, :thumbnail_img => 'marissa_and_travis/principal_stipend_for_leading_school_campaign.jpg'},
  {:name => 'Marketing bundle', :description => 'contains all of the supplies needed to highlight and promote solar lights. This includes sample lights, banners, flyers, radio airtime, etc' , :price => 65.00, :thumbnail_img => 'marissa_and_travis/principal_stipend_for_leading_school_campaign.jpg'},
  {:name => 'Driver to transport solar lights', :description => '' , :price => 50.00, :thumbnail_img => 'marissa_and_travis/principal_stipend_for_leading_school_campaign.jpg'},
  {:name => 'Vehicle repare maintenance, and fuel', :description => '' , :price => 25.00, :thumbnail_img => 'marissa_and_travis/principal_stipend_for_leading_school_campaign.jpg'},
  {:name => 'Room and board for teachers and assitants delivering lights', :description => '' , :price => 50.00 },
  {:name => 'Follow-up interviews and community analysis to assess financial and health benefits following solar light purchase', :description => '' , :price => 7.00 }
])

1.times do |count|
	ItemType.where(name: 'Meeting logistics').first.items.create(:name => "Meeting Logistics #{count}")
end

4.times do |count|
	ItemType.where(name: 'Full participation package for a principal').first.items.create(:name => "Full participation package for a principal #{count}")
end

5.times do |count|
	ItemType.where(name: 'Transportation of SolarAid trainers to rural communities').first.items.create(:name => "Transportation of SolarAid trainers to rural communities #{count}")
end

# registry = Registry.find_by_url_slug('coreys-registry')
# User.find_by_email('cspeisman@gmail.com').registry = registry

# registry.projects = Project.all

Category.destroy_all
# categories = Category.create([
#   { :name => "Africa", :cat_type => "region" },
#   { :name => "Asia", :cat_type => "region" },
#   { :name => "South America", :cat_type => "region" },
#   { :name => "Clean Water", :cat_type => "vertical" }, # TODO: figure out what term to use instead of 'vertical'
#   { :name => "Education", :cat_type => "vertical" },
#   { :name => "Healthcare", :cat_type => "vertical" },
#   { :name => "Microlending", :cat_type => "vertical" }
# ])

# ProjectCategory.destroy_all
# ProjectCategory.create([
#   { :project => projects.first, :category => categories.first },
#   { :project => projects.first, :category => categories.fourth },
#   { :project => projects.second, :category => categories.second },
#   { :project => projects.second, :category => categories.fifth },
#   { :project => projects.third, :category => categories.first },
#   { :project => projects.third, :category => categories.last }
# ])

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
