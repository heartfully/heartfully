couples = Couple.create([
  { :name => "Megan and Mike Fink", :postal_code => "11768", :country => "USA"}
])

users = User.create([
  { :email => "mike@fink.com", :password => "jetsrule", :first_name => "Mike", :last_name => "Fink", :couple_id => couples.first.id },
  { :email => "megan@fink.com", :password => "lilabeast", :first_name => "Megan", :last_name => "Fink", :couple_id => couples.first.id },
  { :email => "seans887@gmail.com", :password => "password", :first_name => "Sean" }
])

registries = Registry.create([
  { :name => "Megan and Mike's Wedding Registry", :couple_id => couples.first.id }
])

orgs = Organization.create([
  { :name => "Charity Water", :admin_id => users.third.id }
])

projects = Project.create([
  { :name => "Build a Well in Ghana", :country => "Ghana", :organization_id => orgs.first.id  }
])

RegistryProject.create([
  { :registry_id => registries.first.id, :project_id => projects.first.id }
])

item_types = ItemType.create([
  { :name => "Shovel", :price => 20.99, :project_id => projects.first.id },
  { :name => "Bag of cement", :price => 40.00, :project_id => projects.first.id },
  { :name => "Filter", :price => 100.00, :project_id => projects.first.id }
])

purchases = Purchase.create([
  { :user_id => users.last.id }
])

Item.create([
  { :name => "Shovel #1", :item_type_id => item_types.first.id, :purchase_id => purchases.first.id },
  { :name => "Shovel #2", :item_type_id => item_types.first.id },
  { :name => "Bag of cement #1", :item_type_id => item_types.second.id, :purchase_id => purchases.first.id },
  { :name => "Bag of cement #2", :item_type_id => item_types.second.id },
  { :name => "Filter #1", :item_type_id => item_types.third.id }
])