require_relative("./projects")
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
  { name: 'Heartfully', admin_id: users.first.id },
  { name: 'Mufindi Orphans', admin_id: users.first.id },
  { name: 'SolarAid', admin_id: users.first.id },
  { name: 'SEM Fund', admin_id: users.first.id },
  { name: 'Many Hopes', admin_id: users.first.id },
  { name: 'The Mary Ryan Foundation', admin_id: users.first.id },
  { name: 'Jiamini', admin_id: users.first.id },
  { name: 'Olive Branch for Children', admin_id: users.first.id },
  { name: 'Greenway', admin_id: users.first.id },
  { name: 'HELPS International', admin_id: users.first.id },
  { name: 'Wishes for Elliott', admin_id: users.first.id },
  { name: 'Love.Futbol', admin_id: users.first.id }
])

projects = all_projects( orgs )

4.times do |num|
  registries[num].projects << projects[num]
  RegistryProject.where(registry_id: registries[num].id, project_id: projects[num].id).first.approve!
end



marrissa_and_travis_items
peter_and_eva_items
katelyn_and_brandon_items
lyndsey_and_matt_items

Category.destroy_all
categories = Category.create([
  { name: "Africa", cat_type: "region" }, #0
  { name: "Asia", cat_type: "region" }, #1
  { name: "India", cat_type: "region" }, #2
  { name: "Kenya", cat_type: "region" }, #3
  { name: "Senegal", cat_type: "region"}, #4
  { name: "South America", cat_type: "region" }, #5
  { name: "Tanzania", cat_type: "region" }, #6
  { name: "Zambia", cat_type: "region" }, #7
  { name: "Capacity Building", cat_type: "issue" }, #8
  { name: "Clean Energy", cat_type: "issue" }, #9
  { name: "Education", cat_type: "issue" }, #10
  { name: "Entrepreneurship", cat_type: "issue" }, #11
  { name: "Environment", cat_type: "issue" }, #12
  { name: "Health", cat_type: "issue" }, #13
  { name: "HIV/AIDS", cat_type: "issue" }, #14
  { name: "Orphans and Vulnerable Children", cat_type: "issue" }, #15
  { name: "Research", cat_type: "issue" }, #16
  { name: "Science", cat_type: "issue" }, #17
  { name: "Sports", cat_type: "issue" }, #18
  { name: "Water", cat_type: "issue" }, #19
  { name: "Women and Girls' Empowerment", cat_type: "issue" }, #20
  { name: "Youth", cat_type: "issue" }, #21
  { name: "Central America", cat_type: "region" }, #22
  { name: "Guatemala", cat_type: "region" }, #23
  { name: "Global", cat_type: "region" }, #24
  { name: "Brazil", cat_type: "region" }, #25
])

ProjectCategory.destroy_all
ProjectCategory.create([
  # Provide business training to women and support clean energy in Senegal
  { project: projects[0], category: categories[0] },
  { project: projects[0], category: categories[4]},
  { project: projects[0], category: categories[9]},
  { project: projects[0], category: categories[12]},
  { project: projects[0], category: categories[13]},
  { project: projects[0], category: categories[20]},

  # Complete Wangama's Clinic
  { project: projects[1], category: categories[1] },
  { project: projects[1], category: categories[6] },
  { project: projects[1], category: categories[15] },

  # Light Up The Night With A Solar Campaign For Zambian Families
  { project: projects[2], category: categories[0] },
  { project: projects[2], category: categories[7] },
  { project: projects[2], category: categories[9] },

  # Train rural community health workers to provide home-based care in Tanzania
  { project: projects[3], category: categories[0] },
  { project: projects[3], category: categories[6] },
  { project: projects[3], category: categories[8] },
  { project: projects[3], category: categories[13] },
  { project: projects[3], category: categories[14] },

  # Launch Three Preschool Programs In Tanzania
  { project: projects[4], category: categories[0] },
  { project: projects[4], category: categories[6] },
  { project: projects[4], category: categories[10] },
  { project: projects[4], category: categories[21] },

  # Provide orphaned and abandoned girls in Kenya with loving homes and education
  { project: projects[5], category: categories[0] },
  { project: projects[5], category: categories[3] },
  { project: projects[5], category: categories[10] },
  { project: projects[5], category: categories[13] },
  { project: projects[5], category: categories[15] },

  # BRING ELECTRICITY TO A VOCATIONAL SCHOOL FOR VULNERABLE CHILDREN IN TANZANIA
  { project: projects[6], category: categories[0] },
  { project: projects[6], category: categories[6] },
  { project: projects[6], category: categories[8] },
  { project: projects[6], category: categories[11] },
  { project: projects[6], category: categories[13] },
  { project: projects[6], category: categories[15] },
  { project: projects[6], category: categories[21] },

  # SPONSORS A GIRL’S EDUCATION IN TANZANIA
  { project: projects[7], category: categories[0] },
  { project: projects[7], category: categories[6] },
  { project: projects[7], category: categories[10] },
  { project: projects[7], category: categories[15] },
  { project: projects[7], category: categories[20] },

  # SEND A STAR STUDENT TO HIGH SCHOOL IN TANZANIA 
  { project: projects[8], category: categories[0] },
  { project: projects[8], category: categories[6] },
  { project: projects[8], category: categories[8] },
  { project: projects[8], category: categories[10] },
  { project: projects[8], category: categories[15] },
  { project: projects[8], category: categories[20] },

  # Refurbish damaged classrooms in Tanzania
  { project: projects[9], category: categories[0] },
  { project: projects[9], category: categories[6] },
  { project: projects[9], category: categories[10] },
  { project: projects[9], category: categories[21] },

  # Bring Early Childhood Education to Vulnerable, Rural Communities
  { project: projects[10], category: categories[0] },
  { project: projects[10], category: categories[6] },
  { project: projects[10], category: categories[8] },
  { project: projects[10], category: categories[10] },

  # Provide families in northern India with safe, efficient and affordable clean cookstoves
  { project: projects[11], category: categories[1] },
  { project: projects[11], category: categories[2] },
  { project: projects[11], category: categories[9] },
  { project: projects[11], category: categories[20] },

  # Develop a New Generation of Youth Entrepreneurs in Senegal
  { project: projects[12], category: categories[0] },
  { project: projects[12], category: categories[9] },
  { project: projects[12], category: categories[11] },
  { project: projects[12], category: categories[13] },
  { project: projects[12], category: categories[21] },

  # Bring high quality medical care to vulnerable populations in rural Guatemala 
  { project: projects[13], category: categories[13] },
  { project: projects[13], category: categories[22] },
  { project: projects[13], category: categories[23] },

  # Provide access to clean water and cooking systems in rural Guatemala
  { project: projects[14], category: categories[9] },
  { project: projects[14], category: categories[13] },
  { project: projects[14], category: categories[19] },
  { project: projects[14], category: categories[22] },
  { project: projects[14], category: categories[23] },

  # Help Children with SCN8A Genetic Neurological Disorders
  { project: projects[15], category: categories[13] },
  { project: projects[15], category: categories[16] },
  { project: projects[15], category: categories[17] },
  { project: projects[15], category: categories[21] },
  { project: projects[15], category: categories[24] },

  # Build a safe place for children to play soccer in Brazil
  { project: projects[15], category: categories[5] },
  { project: projects[15], category: categories[8] },
  { project: projects[15], category: categories[15] },
  { project: projects[15], category: categories[18] },
  { project: projects[15], category: categories[21] },
  { project: projects[15], category: categories[25] }
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
