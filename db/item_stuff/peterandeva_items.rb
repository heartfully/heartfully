def peter_and_eva_items
  item_types = Project.find_by_name("EcoSac women’s entrepreneurship training").item_types.create([
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
    ItemType.where(name: 'Introductory Training').first.items.create(:name => "Introductory Training #{count}")
  end

  10.times do |count|
    ItemType.where(name: 'Business Management Training').first.items.create(name: "Business Management Training #{count}")
  end

  10.times do |count|
    ItemType.where(name: 'Marketing and Communications Training').first.items.create(name: "Marketing and Communications Training #{count}")
  end

  60.times do |count|
    ItemType.where(name: 'Business mentoring visits').first.items.create(name: "Business mentoring visits #{count}")
  end

  20.times do |count|
    ItemType.where(name: 'Promotional events').first.items.create(name: "Promotional events #{count}")
  end

  30.times do |count|
    ItemType.where(name: 'Marketing toolkit').first.items.create(name: "Marketing toolkit #{count}")
  end
end