require_relative("./projects")
require_relative("./item_stuff/marissaandtravis_items")
require_relative("./item_stuff/peterandeva_items")
require_relative("./item_stuff/katelynandbrandon_items")
require_relative("./item_stuff/lyndseyandmatt_items")

# Validating Uniqueness of name and Url_Slug
Registry.create([
  { :name => "Peter and Eva", :url_slug => "peterandeva", :postal_code => "20005" },
  { :name => "Katelyn and Brandon", :url_slug => "wangama", :postal_code => "20005"},
  { :name => "Marissa and Travis", :url_slug => "marissaandtravis", :postal_code => "20005"},
  { :name => "Lindsey and Matt", :url_slug => "lindseyandmatt", :postal_code => "20005" }
])

# Validating Uniqueness of Email
User.create([
  { :email => "cspeisman@gmail.com", :password => "password", :first_name => "Corey", :last_name => "Speisman", :system_admin => true }
])

# Validating Uniqueness of Name
Organization.create([
  { name: 'Heartfully', admin_id: User.find_by_email("cspeisman@gmail.com").id },
  { name: 'Mufindi Orphans', org_url: "http://www.mufindiorphans.org/", admin_id: User.find_by_email("cspeisman@gmail.com").id },
  { name: 'SolarAid', org_url: "http://www.solar-aid.org/", admin_id: User.find_by_email("cspeisman@gmail.com").id },
  { name: 'SEM Fund', org_url: "http://sem-fund.org/home/", admin_id: User.find_by_email("cspeisman@gmail.com").id },
  { name: 'Many Hopes', org_url: "http://www.manyhopes.org/", admin_id: User.find_by_email("cspeisman@gmail.com").id },
  { name: 'The Mary Ryan Foundation', org_url: "http://www.maryryanfoundation.org/", admin_id: User.find_by_email("cspeisman@gmail.com").id },
  { name: 'Jiamini', org_url: "http://www.jiamini.com/", admin_id: User.find_by_email("cspeisman@gmail.com").id },
  { name: 'Olive Branch for Children', org_url: "http://www.theolivebranchforchildren.org/", admin_id: User.find_by_email("cspeisman@gmail.com").id },
  { name: 'Greenway', org_url: "http://www.greenwayappliances.com/", admin_id: User.find_by_email("cspeisman@gmail.com").id },
  { name: 'HELPS International', org_url: "http://www.helpsintl.org/", admin_id: User.find_by_email("cspeisman@gmail.com").id },
  { name: 'Wishes for Elliott', org_url: "http://www.wishesforelliott.org/", admin_id: User.find_by_email("cspeisman@gmail.com").id },
  { name: 'Love.Futbol', org_url: "http://www.lovefutbol.org/", admin_id: User.find_by_email("cspeisman@gmail.com").id }
])

# Validating Uniqueness of Name
all_projects

Registry.find_by_name("Peter and Eva").projects << Project.find_by_name("Provide business training to women and support clean energy in Senegal")
RegistryProject.where( registry_id: Registry.find_by_name("Peter and Eva").id , project_id: Project.find_by_name("Provide business training to women and support clean energy in Senegal").id ).first.approve!

Registry.find_by_name("Katelyn and Brandon").projects << Project.find_by_name("Complete Wangama's Clinic")
RegistryProject.where( registry_id: Registry.find_by_name("Katelyn and Brandon").id , project_id: Project.find_by_name("Complete Wangama's Clinic").id ).first.approve!

Registry.find_by_name("Marissa and Travis").projects << Project.find_by_name("Light Up The Night With A Solar Campaign For Zambian Families")
RegistryProject.where( registry_id: Registry.find_by_name("Marissa and Travis").id, project_id: Project.find_by_name("Light Up The Night With A Solar Campaign For Zambian Families").id).first.approve!

Registry.find_by_name("Lindsey and Matt").projects << Project.find_by_name("Train rural community health workers to provide home-based care in Tanzania")
RegistryProject.where( registry_id: Registry.find_by_name("Lindsey and Matt").id, project_id: Project.find_by_name("Train rural community health workers to provide home-based care in Tanzania").id ).first.approve!

marrissa_and_travis_items
peter_and_eva_items
katelyn_and_brandon_items
lyndsey_and_matt_items

Category.create([
  { name: "Africa", cat_type: "region" },
  { name: "Asia", cat_type: "region" },
  { name: "India", cat_type: "region" },
  { name: "Kenya", cat_type: "region" },
  { name: "Senegal", cat_type: "region"},
  { name: "South America", cat_type: "region" },
  { name: "Tanzania", cat_type: "region" },
  { name: "Zambia", cat_type: "region" },
  { name: "Capacity Building", cat_type: "issue" },
  { name: "Clean Energy", cat_type: "issue" },
  { name: "Education", cat_type: "issue" },
  { name: "Entrepreneurship", cat_type: "issue" },
  { name: "Environment", cat_type: "issue" },
  { name: "Health", cat_type: "issue" },
  { name: "HIV/AIDS", cat_type: "issue" },
  { name: "Orphans and Vulnerable Children", cat_type: "issue" },
  { name: "Research", cat_type: "issue" },
  { name: "Science", cat_type: "issue" },
  { name: "Sports", cat_type: "issue" },
  { name: "Water", cat_type: "issue" },
  { name: "Women and Girl's Empowerment", cat_type: "issue" },
  { name: "Youth", cat_type: "issue" },
  { name: "Central America", cat_type: "region" },
  { name: "Guatemala", cat_type: "region" },
  { name: "Global", cat_type: "region" },
  { name: "Brazil", cat_type: "region" },
])

# ProjectCategory.destroy_all
ProjectCategory.create([
  # Provide business training to women and support clean energy in Senegal
  { project: Project.find_by_name("Provide business training to women and support clean energy in Senegal"), category: Category.find_by_name("Africa") },
  { project: Project.find_by_name("Provide business training to women and support clean energy in Senegal"), category: Category.find_by_name("Senegal") },
  { project: Project.find_by_name("Provide business training to women and support clean energy in Senegal"), category: Category.find_by_name("Clean Energy") },
  { project: Project.find_by_name("Provide business training to women and support clean energy in Senegal"), category: Category.find_by_name("Environment")},
  { project: Project.find_by_name("Provide business training to women and support clean energy in Senegal"), category: Category.find_by_name("Health") },
  { project: Project.find_by_name("Provide business training to women and support clean energy in Senegal"), category: Category.find_by_name("Women and Girl's Empowerment") },

  # Complete Wangama's Clinic
  { project:  Project.find_by_name("Complete Wangama's Clinic"), category: Category.find_by_name("Africa") },
  { project:  Project.find_by_name("Complete Wangama's Clinic"), category: Category.find_by_name("Tanzania") },
  { project:  Project.find_by_name("Complete Wangama's Clinic"), category: Category.find_by_name("Orphans and Vulnerable Children") },

  # Light Up The Night With A Solar Campaign For Zambian Families
  { project:  Project.find_by_name("Light Up The Night With A Solar Campaign For Zambian Families"), category: Category.find_by_name("Africa") },
  { project:  Project.find_by_name("Light Up The Night With A Solar Campaign For Zambian Families"), category: Category.find_by_name("Zambia") },
  { project:  Project.find_by_name("Light Up The Night With A Solar Campaign For Zambian Families"), category: Category.find_by_name("Clean Energy") },

  # Train rural community health workers to provide home-based care in Tanzania
  { project:  Project.find_by_name("Train rural community health workers to provide home-based care in Tanzania"), category: Category.find_by_name("Africa") },
  { project:  Project.find_by_name("Train rural community health workers to provide home-based care in Tanzania"), category: Category.find_by_name("Tanzania") },
  { project:  Project.find_by_name("Train rural community health workers to provide home-based care in Tanzania"), category: Category.find_by_name("Capacity Building") },
  { project:  Project.find_by_name("Train rural community health workers to provide home-based care in Tanzania"), category: Category.find_by_name("Health") },
  { project:  Project.find_by_name("Train rural community health workers to provide home-based care in Tanzania"), category: Category.find_by_name("HIV/AIDS") },

  # Launch Three Preschool Programs In Tanzania
  { project:  Project.find_by_name("Launch Three Preschool Programs In Tanzania"), category: Category.find_by_name("Africa") },
  { project:  Project.find_by_name("Launch Three Preschool Programs In Tanzania"), category: Category.find_by_name("Tanzania") },
  { project:  Project.find_by_name("Launch Three Preschool Programs In Tanzania"), category: Category.find_by_name("Education") },
  { project:  Project.find_by_name("Launch Three Preschool Programs In Tanzania"), category: Category.find_by_name("Youth") },

  # Provide abandoned girls in Kenya with loving homes and education
  { project:  Project.find_by_name("Provide abandoned girls in Kenya with loving homes and education"), category: Category.find_by_name("Africa") },
  { project:  Project.find_by_name("Provide abandoned girls in Kenya with loving homes and education"), category: Category.find_by_name("Kenya") },
  { project:  Project.find_by_name("Provide abandoned girls in Kenya with loving homes and education"), category: Category.find_by_name("Education") },
  { project:  Project.find_by_name("Provide abandoned girls in Kenya with loving homes and education"), category: Category.find_by_name("Health") },
  { project:  Project.find_by_name("Provide abandoned girls in Kenya with loving homes and education"), category: Category.find_by_name("Orphans and Vulnerable Children") },

  # Bring Electricity To a Vocational School For Vulnerable Children In Tanzania
  { project:  Project.find_by_name("Bring Electricity To a Vocational School For Vulnerable Children In Tanzania"), category: Category.find_by_name("Africa") },
  { project:  Project.find_by_name("Bring Electricity To a Vocational School For Vulnerable Children In Tanzania"), category: Category.find_by_name("Tanzania") },
  { project:  Project.find_by_name("Bring Electricity To a Vocational School For Vulnerable Children In Tanzania"), category: Category.find_by_name("Capacity Building") },
  { project:  Project.find_by_name("Bring Electricity To a Vocational School For Vulnerable Children In Tanzania"), category: Category.find_by_name("Entrepreneurship") },
  { project:  Project.find_by_name("Bring Electricity To a Vocational School For Vulnerable Children In Tanzania"), category: Category.find_by_name("Health") },
  { project:  Project.find_by_name("Bring Electricity To a Vocational School For Vulnerable Children In Tanzania"), category: Category.find_by_name("Orphans and Vulnerable Children") },
  { project:  Project.find_by_name("Bring Electricity To a Vocational School For Vulnerable Children In Tanzania"), category: Category.find_by_name("Youth") },

  # Sponsor a Girl's Education In Tanzania
  { project:  Project.find_by_name("Sponsor a Girl's Education In Tanzania"), category: Category.find_by_name("Africa") },
  { project:  Project.find_by_name("Sponsor a Girl's Education In Tanzania"), category: Category.find_by_name("Tanzania") },
  { project:  Project.find_by_name("Sponsor a Girl's Education In Tanzania"), category: Category.find_by_name("Education") },
  { project:  Project.find_by_name("Sponsor a Girl's Education In Tanzania"), category: Category.find_by_name("Orphans and Vulnerable Children") },
  { project:  Project.find_by_name("Sponsor a Girl's Education In Tanzania"), category: Category.find_by_name("Women and Girl's Empowerment") },

  # Send a Star Student To High School In Tanzania
  { project:  Project.find_by_name("Send a Star Student To High School In Tanzania"), category: Category.find_by_name("Africa") },
  { project:  Project.find_by_name("Send a Star Student To High School In Tanzania"), category: Category.find_by_name("Tanzania") },
  { project:  Project.find_by_name("Send a Star Student To High School In Tanzania"), category: Category.find_by_name("Capacity Building") },
  { project:  Project.find_by_name("Send a Star Student To High School In Tanzania"), category: Category.find_by_name("Education") },
  { project:  Project.find_by_name("Send a Star Student To High School In Tanzania"), category: Category.find_by_name("Orphans and Vulnerable Children") },
  { project:  Project.find_by_name("Send a Star Student To High School In Tanzania"), category: Category.find_by_name("Women and Girl's Empowerment") },

  # Refurbish damaged classrooms in Tanzania
  { project:  Project.find_by_name("Refurbish damaged classrooms in Tanzania"), category: Category.find_by_name("Africa") },
  { project:  Project.find_by_name("Refurbish damaged classrooms in Tanzania"), category: Category.find_by_name("Tanzania") },
  { project:  Project.find_by_name("Refurbish damaged classrooms in Tanzania"), category: Category.find_by_name("Education") },
  { project:  Project.find_by_name("Refurbish damaged classrooms in Tanzania"), category: Category.find_by_name("Youth") },

  # Bring Early Childhood Education to Rural Communities
  { project: Project.find_by_name("Bring Early Childhood Education to Rural Communities"), category: Category.find_by_name("Africa") },
  { project: Project.find_by_name("Bring Early Childhood Education to Rural Communities"), category: Category.find_by_name("Tanzania") },
  { project: Project.find_by_name("Bring Early Childhood Education to Rural Communities"), category: Category.find_by_name("Capacity Building") },
  { project: Project.find_by_name("Bring Early Childhood Education to Rural Communities"), category: Category.find_by_name("Education") },

  # Provide families in northern India with safe, efficient and affordable clean cookstoves
  { project: Project.find_by_name("Provide families in India with safe and affordable clean cookstoves"), category: Category.find_by_name("Asia") },
  { project: Project.find_by_name("Provide families in India with safe and affordable clean cookstoves"), category: Category.find_by_name("India") },
  { project: Project.find_by_name("Provide families in India with safe and affordable clean cookstoves"), category: Category.find_by_name("Clean Energy") },
  { project: Project.find_by_name("Provide families in India with safe and affordable clean cookstoves"), category: Category.find_by_name("Women and Girl's Empowerment") },

  # Develop a New Generation of Youth Entrepreneurs in Senegal
  { project: Project.find_by_name("Develop a New Generation of Youth Entrepreneurs in Senegal"), category: Category.find_by_name("Africa") },
  { project: Project.find_by_name("Develop a New Generation of Youth Entrepreneurs in Senegal"), category: Category.find_by_name("Senegal") },
  { project: Project.find_by_name("Develop a New Generation of Youth Entrepreneurs in Senegal"), category: Category.find_by_name("Clean Energy") },
  { project: Project.find_by_name("Develop a New Generation of Youth Entrepreneurs in Senegal"), category: Category.find_by_name("Entrepreneurship") },
  { project: Project.find_by_name("Develop a New Generation of Youth Entrepreneurs in Senegal"), category: Category.find_by_name("Health") },
  { project: Project.find_by_name("Develop a New Generation of Youth Entrepreneurs in Senegal"), category: Category.find_by_name("Youth") },

  # Bring high quality medical care to vulnerable populations in rural Guatemala 
  { project: Project.find_by_name("Bring high-quality medical care to vulnerable populations in rural Guatemala"), category: Category.find_by_name("Health") },
  { project: Project.find_by_name("Bring high-quality medical care to vulnerable populations in rural Guatemala"), category: Category.find_by_name("Central America") },
  { project: Project.find_by_name("Bring high-quality medical care to vulnerable populations in rural Guatemala"), category: Category.find_by_name("Guatemala") },

  # Provide access to clean water and cooking systems in rural Guatemala
  { project: Project.find_by_name("Provide access to clean water and cooking systems in rural Guatemala"), category: Category.find_by_name("Clean Energy") },
  { project: Project.find_by_name("Provide access to clean water and cooking systems in rural Guatemala"), category: Category.find_by_name("Health") },
  { project: Project.find_by_name("Provide access to clean water and cooking systems in rural Guatemala"), category: Category.find_by_name("Water") },
  { project: Project.find_by_name("Provide access to clean water and cooking systems in rural Guatemala"), category: Category.find_by_name("Central America") },
  { project: Project.find_by_name("Provide access to clean water and cooking systems in rural Guatemala"), category: Category.find_by_name("Guatemala") },

  # Help Children with SCN8A Genetic Neurological Disorders
  { project: Project.find_by_name("Help Children with SCN8A Genetic Neurological Disorders"), category: Category.find_by_name("Global") },
  { project: Project.find_by_name("Help Children with SCN8A Genetic Neurological Disorders"), category: Category.find_by_name("Health") },
  { project: Project.find_by_name("Help Children with SCN8A Genetic Neurological Disorders"), category: Category.find_by_name("Research") },
  { project: Project.find_by_name("Help Children with SCN8A Genetic Neurological Disorders"), category: Category.find_by_name("Science") },
  { project: Project.find_by_name("Help Children with SCN8A Genetic Neurological Disorders"), category: Category.find_by_name("Youth") },

  # Build a safe place for children to play soccer in Brazil
  { project: Project.find_by_name("Build a safe place for children to play soccer in Brazil"), category: Category.find_by_name("Brazil") },
  { project: Project.find_by_name("Build a safe place for children to play soccer in Brazil"), category: Category.find_by_name("South America") },
  { project: Project.find_by_name("Build a safe place for children to play soccer in Brazil"), category: Category.find_by_name("Capacity Building") },
  { project: Project.find_by_name("Build a safe place for children to play soccer in Brazil"), category: Category.find_by_name("Orphans and Vulnerable Children") },
  { project: Project.find_by_name("Build a safe place for children to play soccer in Brazil"), category: Category.find_by_name("Sports") },
  { project: Project.find_by_name("Build a safe place for children to play soccer in Brazil"), category: Category.find_by_name("Youth") },


])