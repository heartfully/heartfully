# require_relative("./projects")
# require_relative("./item_stuff/marissaandtravis_items")
# require_relative("./item_stuff/peterandeva_items")
# require_relative("./item_stuff/katelynandbrandon_items")
# require_relative("./item_stuff/lyndseyandmatt_items")

# Validating Uniqueness of name and Url_Slug
# Registry.create([
#   { :name => "Peter and Eva", :url_slug => "peterandeva", :postal_code => "20005" },
#   { :name => "Katelyn and Brandon", :url_slug => "wangama", :postal_code => "20005"},
#   { :name => "Marissa and Travis", :url_slug => "marissaandtravis", :postal_code => "20005"},
#   { :name => "Lindsey and Matt", :url_slug => "lindseyandmatt", :postal_code => "20005" }
# ])

# Validating Uniqueness of Email
# User.create([
#   { :email => "cspeisman@gmail.com", :password => "password", :first_name => "Corey", :last_name => "Speisman", :system_admin => true }
# ])

# Validating Uniqueness of Name
# Organization.create([
#   { name: 'Heartfully', admin_id: User.find_by_email("cspeisman@gmail.com").id },
#   { name: 'Mufindi Orphans', admin_id: User.find_by_email("cspeisman@gmail.com").id },
#   { name: 'Solar-Aid', admin_id: User.find_by_email("cspeisman@gmail.com").id },
#   { name: 'SEM Fund', admin_id: User.find_by_email("cspeisman@gmail.com").id },
#   { name: 'Many Hopes', admin_id: User.find_by_email("cspeisman@gmail.com").id },
#   { name: 'The Mary Ryan Foundation', admin_id: User.find_by_email("cspeisman@gmail.com").id },
#   { name: 'Jiamini', admin_id: User.find_by_email("cspeisman@gmail.com").id },
#   { name: 'Olive Branch for Children', admin_id: User.find_by_email("cspeisman@gmail.com").id },
#   { name: 'Greenway', admin_id: User.find_by_email("cspeisman@gmail.com").id },
#   { name: 'HELPS International', admin_id: User.find_by_email("cspeisman@gmail.com").id },
#   { name: 'Wishes for Elliott', admin_id: User.find_by_email("cspeisman@gmail.com").id },
#   { name: 'Love.Futbol', admin_id: User.find_by_email("cspeisman@gmail.com").id }
# ])

# Validating Uniqueness of Name
# all_projects

# Registry.find_by_name("Peter and Eva").projects << Project.find_by_name("Provide business training to women and support clean energy in Senegal")
# RegistryProject.where( registry_id: Registry.find_by_name("Peter and Eva").id , project_id: Project.find_by_name("Provide business training to women and support clean energy in Senegal").id ).first.approve!

# Registry.find_by_name("Katelyn and Brandon").projects << Project.find_by_name("Complete Wangama's Clinic")
# RegistryProject.where( registry_id: Registry.find_by_name("Katelyn and Brandon").id , project_id: Project.find_by_name("Complete Wangama's Clinic").id ).first.approve!

# Registry.find_by_name("Marissa and Travis").projects << Project.find_by_name("Light Up The Night With A Solar Campaign For Zambian Families")
# RegistryProject.where( registry_id: Registry.find_by_name("Marissa and Travis").id, project_id: Project.find_by_name("Light Up The Night With A Solar Campaign For Zambian Families").id).first.approve!

# Registry.find_by_name("Lindsey and Matt").projects << Project.find_by_name("Train rural community health workers to provide home-based care in Tanzania")
# RegistryProject.where( registry_id: Registry.find_by_name("Lindsey and Matt").id, project_id: Project.find_by_name("Train rural community health workers to provide home-based care in Tanzania").id ).first.approve!

# marrissa_and_travis_items
# peter_and_eva_items
# katelyn_and_brandon_items
# lyndsey_and_matt_items

# ProjectCategory.destroy_all
