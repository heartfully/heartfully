def marrissa_and_travis_items
  item_types = Project.find_by_name('Light up the night solar energy campaign').item_types.create([
    {:name => 'Meeting logistics: SolarAid kicks off each solar campaign with a meeting at the district and regional level of every community it works in to ensure buy-in at all levels of government.', :description => '', :price => 60.00, :thumbnail_img => "marissa_and_travis/meeting_logistics.jpg"},
    {:name => 'Full participation package for a principal: School principals are trained on the benefits of solar energy and how to communicate those benefits to the parents and guardians of students.', :description => '' , 
      :price => 100.00, 
      :thumbnail_img => 'marissa_and_travis/full_participation_package.jpg'},
    {:name => 'Transportation of SolarAid trainers to rural communities', :description => '' , 
      :price => 35.00, 
      :thumbnail_img => "marissa_and_travis/transportation_of_sa_trainers.jpg"},
    {:name => "Principal stipend for leading the school’s solar campaign: Training stipend for each principal leading the school's solar campaign.", 
      :description => '' , :price => 50.00, 
      :thumbnail_img => 'marissa_and_travis/principal_stipend_for_leading_school_campaign.jpg'},
    {:name => 'Marketing bundle: A bundle contains all of the supplies needed to highlight and promote solar lights including sample lights, brochures, banners, etc.', 
      :description => 'contains all of the supplies needed to highlight and promote solar lights. This includes sample lights, banners, flyers, radio airtime, etc' , 
      :price => 65.00, 
      :thumbnail_img => "marissa_and_travis/marketing_bundle.jpg"},
    {:name => 'Driver to transport solar lights', 
      :description => '' , 
      :price => 50.00, 
      :thumbnail_img => 'marissa_and_travis/driver_to_deliver solar_lights.jpg'},
    {
      :name => 'Vehicle repair, maintenance, and fuel: poorly maintained roads can make for a very challenging journey!',
      :price => 25.00,
      :thumbnail_img => "marissa_and_travis/vehicle_repair_and_maint.jpg"
    },
    {:name => 'Room and board for teachers and assistants delivering lights: Lodging and food for teacher and assistants delivering lights to rural communities',
     :description => '', 
     :price => 50.00,
     :thumbnail_img => "marissa_and_travis/room_and_board_for_assistants.jpg"},
    {:name => 'Follow-up interviews: These are conducted by SolarAid to assess the financial and health benefits that occur after a solar light purchase.', 
      :description => '', 
      :price => 100.00,
      :thumbnail_img => 'marissa_and_travis/follow_up interviews.jpg' },
    {
      :name => 'Communications coordination (phone and internet): Communications coordination for light deliveries',
      :price => 25.00,
      :thumbnail_img => "marissa_and_travis/communications_coordination.jpg"
    }
  ])

  1.times do |count|
    ItemType.where(name: 'Meeting logistics: SolarAid kicks off each solar campaign with a meeting at the district and regional level of every community it works in to ensure buy-in at all levels of government.').first.items.create(:name => "Meeting Logistics #{count}")
  end

  4.times do |count|
    ItemType.where(name: 'Full participation package for a principal: School principals are trained on the benefits of solar energy and how to communicate those benefits to the parents and guardians of students.').first.items.create(:name => "Full participation package for a principal #{count}")
  end

  5.times do |count|
    ItemType.where(name: 'Transportation of SolarAid trainers to rural communities').first.items.create(:name => "Transportation of SolarAid trainers to rural communities #{count}")
  end

  8.times do |count|
    ItemType.where(name: "Principal stipend for leading the school’s solar campaign: Training stipend for each principal leading the school's solar campaign.").first.items.create(:name => "Principal stipend for leading the school’s solar campaign #{count}")
  end

  4.times do |count|
    ItemType.where(name: 'Marketing bundle: A bundle contains all of the supplies needed to highlight and promote solar lights including sample lights, brochures, banners, etc.').first.items.create(:name => "Marketing bundle #{count}")
  end

  2.times do |count|
    ItemType.where(name: 'Driver to transport solar lights').first.items.create(name: "Driver to transport solar lights #{count}")
  end

  10.times do |count|
    ItemType.find_by_name('Vehicle repair, maintenance, and fuel: poorly maintained roads can make for a very challenging journey!').items.create(name: "Vehicle repair, maintenance, and fuel #{count}")
  end

  4.times do |count|
    ItemType.find_by_name('Communications coordination (phone and internet): Communications coordination for light deliveries').items.create(name: "Communications coordination (phone and internet) #{count}")
  end

  10.times do |count|
    ItemType.find_by_name('Room and board for teachers and assistants delivering lights: Lodging and food for teacher and assistants delivering lights to rural communities').items.create(name: "Room and board for teachers and assistants delivering lights #{count}")
  end

  7.times do |count|
    ItemType.find_by_name('Follow-up interviews: These are conducted by SolarAid to assess the financial and health benefits that occur after a solar light purchase.').items.create(name: "Follow-up interviews and community analysis to assess financial and health benefits following solar light purchase #{count}")
  end
end