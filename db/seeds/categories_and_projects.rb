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

  # Provide orphaned and abandoned girls in Kenya with loving homes and education
  { project:  Project.find_by_name("Provide orphaned and abandoned girls in Kenya with loving homes and education"), category: Category.find_by_name("Africa") },
  { project:  Project.find_by_name("Provide orphaned and abandoned girls in Kenya with loving homes and education"), category: Category.find_by_name("Kenya") },
  { project:  Project.find_by_name("Provide orphaned and abandoned girls in Kenya with loving homes and education"), category: Category.find_by_name("Education") },
  { project:  Project.find_by_name("Provide orphaned and abandoned girls in Kenya with loving homes and education"), category: Category.find_by_name("Health") },
  { project:  Project.find_by_name("Provide orphaned and abandoned girls in Kenya with loving homes and education"), category: Category.find_by_name("Orphans and Vulnerable Children") },

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

  # Bring Early Childhood Education to Vulnerable, Rural Communities
  { project: Project.find_by_name("Bring Early Childhood Education to Vulnerable, Rural Communities"), category: Category.find_by_name("Africa") },
  { project: Project.find_by_name("Bring Early Childhood Education to Vulnerable, Rural Communities"), category: Category.find_by_name("Tanzania") },
  { project: Project.find_by_name("Bring Early Childhood Education to Vulnerable, Rural Communities"), category: Category.find_by_name("Capacity Building") },
  { project: Project.find_by_name("Bring Early Childhood Education to Vulnerable, Rural Communities"), category: Category.find_by_name("Education") },

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
  { project: Project.find_by_name("Bring high quality medical care to vulnerable populations in rural Guatemala"), category: Category.find_by_name("Health") },
  { project: Project.find_by_name("Bring high quality medical care to vulnerable populations in rural Guatemala"), category: Category.find_by_name("Central America") },
  { project: Project.find_by_name("Bring high quality medical care to vulnerable populations in rural Guatemala"), category: Category.find_by_name("Guatemala") },

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
  { project: Project.find_by_name("Build a safe place for children to play soccer in Brazil"), category: Category.find_by_name("Youth") }
])