registry = Registry.create(name: 'Danielle & Dieter', 
                url_slug: 'd+d', 
                postal_code: '20005',
                description: '<p>This registry is as much a gesture of our shared passion for enriching the lives of Senegalese women and families as it is a reflection of our belief that our marriage is not ultimately about the two of us, but rather a call to service and charity as husband and wife. We believe our shared gifts and talents are to be used at home and around the world to bring hope and joy to the lives of others.</p>',
                couples_story: '<p>We met in our early days at St. Olaf College and were close friends for several years. After graduation we took off on very distinct paths—Danielle to grad school in Ithaca and then 5 years with the Peace Corps in Senegal; Alec taught English in France for a year before returning to the States to finish grad school and land a job in Minnesota. Our relationship took off in the summer of 2013 when Danielle was back in the States to visit family in Minnesota and for her sister’s wedding in Colorado.  And almost two years later here we are preparing for our wedding!</p><p>Throughout the years, as both friends and as a couple, we’ve had a common passion for the people of Senegal. Alec studied abroad in Senegal for 5 months in college, and Danielle considers Senegal her second-home after having lived there for 5 years.  We both found our time in Senegal to be incredibly challenging but also very rewarding, and over the years we shared emails, letters, and many conversations helping each other to make sense of our different experiences there.</p>',
                banner_img: 'https://cdn.rawgit.com/Heartfully/registry-images/master/d+d/d+d_bannerphoto.jpg',
                profile_img: 'https://rawgit.com/Heartfully/registry-images/master/d+d/d+d_profilephoto.jpg'
               )
project = registry.projects.create(name: "EcoSac women’s entrepreneurship training 1", headline: "EcoSac Women's Entrepreneurship Training", :organization_id => Organization.first.id, :country => "Senegal",:funding_goal => 1234.32 )
item_types = project.item_types.create([
    {:name => 'Introductory Training', 
      :description => 'An overview on alternative energy benefits, the EcoSac, and exercises in women’s empowerment', 
      :price => 60.00, 
      :thumbnail_img => 'eva_and_peter/copy_of_intro_training.jpg'},
    {:name => 'Business Management Training', 
      :description => 'Technical skills building that covers basic accounting, how to run and grow a small business, and how to manage savings.', 
      :price => 100.00, 
      :thumbnail_img => 'eva_and_peter/business_management_training.jpg'},
    {:name => 'Marketing and Communications Training', 
      :description => ' An exercise in how to effectively promote and close the deal', 
      :price => 75.00, 
      :thumbnail_img => 'eva_and_peter/marketing_and_comms_training.jpg'},
    {:name => 'Business mentoring visits', 
      :description => 'meet with the training graduates once a month for a minimum of six months to check in on their progress,SEM Fund staff  offer encouragement, and provide continued business and marketing support', 
      :price => 50.00, 
      :thumbnail_img => 'eva_and_peter/mentoring_visit.jpg'},
    {:name => 'Promotional events', 
      :description => 'Events are held at each woman’s local market. She is provided with a stall and marketing materials to educate shoppers and sell EcoSacs.', 
      :price => 75.00, 
      :thumbnail_img => 'eva_and_peter/promotional_events.jpg'},
    {:name => 'Marketing toolkit', 
      :description => 'Toolkits contain visual posters that explain how to use an EcoSac; flyers with information about the benefits of alternative energy, and a professional EcoSac vendor tshirt.', 
      :price => 30.00, 
      :thumbnail_img => 'eva_and_peter/marketing_toolkit.jpg'}
  ])

10.times do |count|
    project.item_types.where(name: 'Introductory Training').first.items.create(:name => "Introductory Training #{count}")
  end

  10.times do |count|
    project.item_types.where(name: 'Business Management Training').first.items.create(name: "Business Management Training #{count}")
  end

  10.times do |count|
    project.item_types.where(name: 'Marketing and Communications Training').first.items.create(name: "Marketing and Communications Training #{count}")
  end

  40.times do |count|
    project.item_types.where(name: 'Business mentoring visits').first.items.create(name: "Business mentoring visits #{count}")
  end

  20.times do |count|
    project.item_types.where(name: 'Promotional events').first.items.create(name: "Promotional events #{count}")
  end

  20.times do |count|
    project.item_types.where(name: 'Marketing toolkit').first.items.create(name: "Marketing toolkit #{count}")
  end

registry.registry_projects.first.approve!
