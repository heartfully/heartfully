def marrissa_and_travis_items
  item_types = Project.find_by_name('Light Up The Night With A Solar Campaign For Zambian Families').item_types.create([
    {:name => 'Meeting logistics', 
      :description => 'SolarAid kicks off each solar campaign with a meeting at the district and regional level of every community it works in to ensure buy-in at all levels of government.', 
      :price => 60.00, 
      :thumbnail_img => "marissa_and_travis/meeting_logistics.jpg"},
    {:name => 'Full participation package for a principal',
      :description => 'School principals are trained on the benefits of solar energy and how to communicate those benefits to the parents and guardians of students.' , 
      :price => 100.00, 
      :thumbnail_img => 'marissa_and_travis/full_participation_package.jpg'},
    {:name => 'Transportation of SolarAid trainers to rural communities',
      :description => '' , 
      :price => 35.00, 
      :thumbnail_img => "marissa_and_travis/transportation_of_sa_trainers.jpg"},
    {:name => "Training stipend for each principal leading the school's solar campaign.", 
      :description => '' ,
      :price => 50.00,
      :thumbnail_img => 'marissa_and_travis/principal_stipend_for_leading_school_campaign.jpg'},
    {:name => 'Marketing bundle', 
      :description => 'A bundle contains all of the supplies needed to highlight and promote solar lights including sample lights, brochures, banners, etc.' , 
      :price => 65.00, 
      :thumbnail_img => "marissa_and_travis/marketing_bundle.jpg"},
    {:name => 'Driver to transport solar lights', 
      :description => '' , 
      :price => 50.00, 
      :thumbnail_img => 'marissa_and_travis/driver_to_deliver solar_lights.jpg'},
    {
      :name => 'Vehicle repair, maintenance, and fuel',
      :description => ' poorly maintained roads can make for a very challenging journey!',
      :price => 25.00,
      :thumbnail_img => "marissa_and_travis/vehicle_repair_and_maint.jpg"
    },
    {:name => 'Lodging and food for teacher and assistants delivering lights to rural communities',
     :description => '', 
     :price => 50.00,
     :thumbnail_img => "marissa_and_travis/room_and_board_for_assistants.jpg"},
    {:name => 'Follow-up interviews', 
      :description => 'These are conducted by SolarAid to assess the financial and health benefits that occur after a solar light purchase.', 
      :price => 100.00,
      :thumbnail_img => 'marissa_and_travis/follow_up interviews.jpg' },
    {
      :name => 'Communications coordination for light deliveries',
      :price => 25.00,
      :thumbnail_img => "marissa_and_travis/communications_coordination.jpg"
    }
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

  8.times do |count|
    ItemType.where(name: "Training stipend for each principal leading the school's solar campaign.").first.items.create(:name => "Principal stipend for leading the school’s solar campaign #{count}")
  end

  4.times do |count|
    ItemType.where(name: 'Marketing bundle').first.items.create(:name => "Marketing bundle #{count}")
  end

  2.times do |count|
    ItemType.where(name: 'Driver to transport solar lights').first.items.create(name: "Driver to transport solar lights #{count}")
  end

  10.times do |count|
    ItemType.find_by_name('Vehicle repair, maintenance, and fuel').items.create(name: "Vehicle repair, maintenance, and fuel #{count}")
  end

  4.times do |count|
    ItemType.find_by_name('Communications coordination for light deliveries').items.create(name: "Communications coordination (phone and internet) #{count}")
  end

  10.times do |count|
    ItemType.find_by_name('Lodging and food for teacher and assistants delivering lights to rural communities').items.create(name: "Room and board for teachers and assistants delivering lights #{count}")
  end

  7.times do |count|
    ItemType.find_by_name('Follow-up interviews').items.create(name: "Follow-up interviews and community analysis to assess financial and health benefits following solar light purchase #{count}")
  end
end