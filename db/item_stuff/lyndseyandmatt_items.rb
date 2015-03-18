def lyndsey_and_matt_items
  item_types = Project.find_by_name("Home-Based Care Program").item_types.create([
    {:name => 'Training facility', :description => '' , 
         :price => 100.00, 
         :thumbnail_img => 'matt_and_lindsey/building_icon.png'},
    {:name => 'course materials', :description => '' , 
         :price => 30.00, 
         :thumbnail_img => 'matt_and_lindsey/pen_and_paper.png'},
    {:name => 'basic anatomy', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/heart_icon.png'},
    {:name => 'facts about HIV/AIDs', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/health_star_icon.png'},
    {:name => 'HIV prevention', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/needle_icon.png'},
    {:name => 'community health workers and HIV prevention', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/nurse_icon.png'},
    {:name => 'Managing and treating AIDS-related conditions', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/notepad.png'},
    {:name => 'care in the final stages of life', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/doctor_tool.png'},
    {:name => 'promoting positive living', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/heart_icon.png'},
    {:name => 'Healthy minds', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/nurse_icon.png'},
    {:name => 'basic nursing care', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/first_aid_kit_icon.png'},
    {:name => 'Medicines', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/first_aid_kit_icon.png'},
    {:name => 'Infection prevention', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/needle_icon.png'},
    {:name => 'Assessing needs of clients and caregivers', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/notepad.png'},
    {:name => 'Basic personal hygiene', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/health_star_icon.png'},
    {:name => 'Role of good nutrition', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/tomato_icon.png'},
    {:name => 'Special food and nutrition', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/fish_icon.png'},
    {:name => 'Intro to family planning', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/doctor_tool.png'},
    {:name => 'Conception, contraception, childbirth', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/notepad.png'},
    {:name => 'Preventing mother to child transmission', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/heart_icon.png'},
    {:name => 'Types of family planning', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/notepad.png'},
    {:name => 'Helping clients use family planning', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/doctor_tool.png'},
    {:name => 'Mobilizing community support for PLHIV', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/group_icon.png'},
    {:name => 'ART', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/calender_icon.png'},
    {:name => 'HIV care and treatment', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/tube_icon.png'},
    {:name => 'Mobilizing commnunity around PMTCT', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/3_people_icon.png'},
    {:name => 'Preventing pressure sores', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/bandaid_icon.png'},
    {:name => 'Groups needing special prevention', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/3_people_icon.png'},
    {:name => 'Teaching others and transferring skills', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/group_icon.png'},
    {:name => 'Practical skills treating clients', :description => '' , 
         :price => 50.00, 
         :thumbnail_img => 'matt_and_lindsey/first_aid_kit_icon.png'}
  ])

  14.times do |count|
      ItemType.where(name: 'Training facility').first.items.create(:name => "Training facility #{count}")
  end

  22.times do |count|
      ItemType.where(name: 'course materials').first.items.create(:name => "course materials #{count}")
  end

  1.times do |count|
      ItemType.where(name: 'basic anatomy').first.items.create(:name => "basic anatomy #{count}")
  end

  ItemType.where(name: 'facts about HIV/AIDs').first.items.create(:name => "facts about HIV/AIDs 1")
  ItemType.where(name: 'HIV prevention').first.items.create(:name => "HIV prevention 1")
  ItemType.where(name: 'community health workers and HIV prevention').first.items.create(:name => "community health workers and HIV prevention 1")
  ItemType.where(name: 'Managing and treating AIDS-related conditions').first.items.create(:name => "Managing and treating AIDS-related conditions 1")
  ItemType.where(name: 'care in the final stages of life').first.items.create(:name => "care in the final stages of life 1")
  ItemType.where(name: 'promoting positive living').first.items.create(:name => "promoting positive living 1")
  ItemType.where(name: 'Healthy minds').first.items.create(:name => "Healthy minds 1")
  ItemType.where(name: 'basic nursing care').first.items.create(:name => "basic nursing care 1")
  ItemType.where(name: 'Medicines').first.items.create(:name => "Medicines 1")
  ItemType.where(name: 'Infection prevention').first.items.create(:name => "Infection prevention 1")
  ItemType.where(name: 'Assessing needs of clients and caregivers').first.items.create(:name => "Assessing needs of clients and caregivers 1")
  ItemType.where(name: 'Basic personal hygiene').first.items.create(:name => "Basic personal hygiene 1")
  ItemType.where(name: 'Role of good nutrition').first.items.create(:name => "Role of good nutrition 1")
  ItemType.where(name: 'Special food and nutrition').first.items.create(:name => "Special food and nutrition 1")
  ItemType.where(name: 'Intro to family planning').first.items.create(:name => "Intro to family planning 1")
  ItemType.where(name: 'Conception, contraception, childbirth').first.items.create(:name => "Conception, contraception, childbirth 1")
  ItemType.where(name: 'Preventing mother to child transmission').first.items.create(:name => "Preventing mother to child transmission 1")
  ItemType.where(name: 'Types of family planning').first.items.create(:name => "Types of family planning 1")
  ItemType.where(name: 'Helping clients use family planning').first.items.create(:name => "Helping clients use family planning 1")
  ItemType.where(name: 'Mobilizing community support for PLHIV').first.items.create(:name => "Mobilizing community support for PLHIV 1")
  ItemType.where(name: 'ART').first.items.create(:name => "ART 1")
  ItemType.where(name: 'HIV care and treatment').first.items.create(:name => "HIV care and treatment 1")
  ItemType.where(name: 'Mobilizing commnunity around PMTCT').first.items.create(:name => "Mobilizing commnunity around PMTCT 1")
  ItemType.where(name: 'Preventing pressure sores').first.items.create(:name => "Preventing pressure sores 1")
  ItemType.where(name: 'Groups needing special prevention').first.items.create(:name => "Groups needing special prevention 1")
  ItemType.where(name: 'Teaching others and transferring skills').first.items.create(:name => "Teaching others and transferring skills 1")
  ItemType.where(name: 'Practical skills treating clients').first.items.create(:name => "Practical skills treating clients 1")

end