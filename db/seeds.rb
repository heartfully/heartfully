Registry.destroy_all
# registries = Registry.create([
#   { :name => "Peter and Eva", :url_slug => "PeterandEva", :banner_img => "eva_and_peter/peter_and_eva_banner_photo.jpg", :profile_img => "eva_and_peter/peter_and_eva_profile_photo.jpg", :description => },
#   { :name => "Katelyn and Brandon", :url_slug => "wangama"},
#   { :name => "Marissa and Travis", :url_slug => "marissaandtravis"},
#   { :name => "Lindsey and Matt", :url_slug => "LindseyandMatt"}
# ])

User.destroy_all
# users = User.create([
#   { :email => "mike@fink.com", :password => "jetsrule", :first_name => "Mike", :last_name => "Fink", :registry_id => registries.first.id },
#   { :email => "megan@fink.com", :password => "lilabeast", :first_name => "Megan", :last_name => "Fink", :registry_id => registries.first.id },
#   { :email => "seans887@gmail.com", :password => "password", :first_name => "Sean", :last_name => "Shannon" },
#   { :email => "cspeisman@gmail.com", :password => "password", :first_name => "Corey", :last_name => "Speisman", :system_admin => true }
# ])

Organization.destroy_all
# orgs = Organization.create([
#   { :name => "Charity Water", :admin_id => users.third.id }
# ])

# Project.destroy_all
# projects = Project.create([
#   { :name => "EcoSac women’s empowerment training", :description => "The EcoSac women’s empowerment training will support women in Senegal to promote an affordable energy alternative that is not only more efficient and safer for family health, but is also an income generator for women leaders in the community.", },
#   { :name => "Build a Well in 1", :country => "Ghana", :organization_id => orgs.first.id  },
#   { :name => "Build a Well in 2", :country => "Ghana", :organization_id => orgs.first.id  },
#   { :name => "Build a Well in 3", :country => "Ghana", :organization_id => orgs.first.id  },
#   { :name => "Build a Well in 4", :country => "Ghana", :organization_id => orgs.first.id  },
#   { :name => "Build a Well in 5", :country => "Ghana", :organization_id => orgs.first.id  },
#   { :name => "Build a Well in 6", :country => "Ghana", :organization_id => orgs.first.id  },
#   { :name => "Build a Well in 7", :country => "Ghana", :organization_id => orgs.first.id  }
# ])

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
Item.create([
  { :name => "Shovel #1", :item_type_id => item_types.first.id, :purchase_id => purchases.first.id },
  { :name => "Shovel #2", :item_type_id => item_types.first.id },
  { :name => "Bag of cement #1", :item_type_id => item_types.second.id, :purchase_id => purchases.first.id },
  { :name => "Bag of cement #2", :item_type_id => item_types.second.id },
  { :name => "Filter #1", :item_type_id => item_types.third.id }
])
