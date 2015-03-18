def katelyn_and_brandon_items
  item_types = Project.find_by_name("Complete Wangama's Clinic").item_types.create([
    {:name => 'cement', :description => '' , 
    :price => 10.00, 
    :thumbnail_img => 'katelyn_and_brandon/cement.jpg'},
    {:name => 'building rods', :description => '' , 
    :price => 25.00, 
    :thumbnail_img => 'katelyn_and_brandon/building_rods.jpg'},
    {:name => 'doors and frame', :description => '' , 
    :price => 55.00, 
    :thumbnail_img => 'katelyn_and_brandon/door.jpg'},
    {:name => 'windows', :description => '' , 
     :price => 50.00, 
     :thumbnail_img => 'katelyn_and_brandon/windows.jpg'},
    {:name => 'shutters', :description => '' , 
     :price => 25.00, 
     :thumbnail_img => 'katelyn_and_brandon/shutters.jpg'},
    {:name => 'boards', :description => '' , 
     :price => 30.00, 
     :thumbnail_img => 'katelyn_and_brandon/wood_planks.jpg'},
    {:name => 'tin', :description => '' , 
     :price => 20.00, 
     :thumbnail_img => 'katelyn_and_brandon/tin.jpg'},
    {:name => 'nails', :description => '' , 
     :price => 20.00, 
     :thumbnail_img => 'katelyn_and_brandon/nails.jpg'},
    {:name => 'plywood', :description => '' , 
     :price => 75.00, 
     :thumbnail_img => 'katelyn_and_brandon/plywood.jpg'},
    {:name => 'glass', :description => '' , 
     :price => 40.00, 
     :thumbnail_img => 'katelyn_and_brandon/glass.jpg'}
  ])

  100.times do |count|
    ItemType.where(name: 'cement').first.items.create(:name => "cement #{count}")
  end

  9.times do |count|
    ItemType.where(name: 'building rods').first.items.create(:name => "building rods #{count}")
  end

  2.times do |count|
    ItemType.where(name: 'doors and frame').first.items.create(:name => "doors and frame #{count}")
  end

  7.times do |count|
    ItemType.where(name: 'windows').first.items.create(:name => "windows #{count}")
  end

  25.times do |count|
    ItemType.where(name: 'shutters').first.items.create(:name => "shutters #{count}")
  end

  37.times do |count|
    ItemType.where(name: 'boards').first.items.create(:name => "boards #{count}")
  end

  29.times do |count|
    ItemType.where(name: 'tin').first.items.create(:name => "tin #{count}")
  end

  4.times do |count|
    ItemType.where(name: 'nails').first.items.create(:name => "nails #{count}")
  end

  2.times do |count|
    ItemType.where(name: 'plywood').first.items.create(:name => "plywood #{count}")
  end

  7.times do |count|
    ItemType.where(name: 'glass').first.items.create(:name => "glass #{count}")
  end
end