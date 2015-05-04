puts "====== start ======="
Project.find_or_create_by(name: "Provide business training to women and support clean energy in Senegal").update(name: "Provide business training to women and support clean energy in Senegal", 
      partner: "SEM Fund",
      description: "This project trains cohorts of Senegalese women to use cleaner cooker systems and convincingly promote and sell clean energy cooking products to their communities.",
      organization_id: Organization.find_by_name("SEM Fund").id, 
      funding_goal: 6000,
      city: "Senegal",
      country: "Africa", 
      url_slug: "semfund-womens-business-training",
      project_photo: "eva_and_peter/eva_and_peter_project_photo.jpg",
      project_photo_2: "projects/female-business-training/photo_2.jpg",
      project_photo_3: "projects/female-business-training/photo_3.jpg",
      extra_content: {
        :"The Problem" => "Currently, in Senegal, a meal takes on average 3.5 hours to cook and uses between $1 and $2 worth of fuel per meal.  The economic, health and environmental burden of this task and its associated health risks often fall on women, who are the primary cooks in Senegalese households.",
        :"The Opportunity" => "The EcoSac is a temperature retention bag that reduces the time, energy, and money necessary for households to cook. By using the EcoSac, low-income families in Senegal can lessen the impact that cooking has on the environment and on their health, all while cutting their expenses.",
        :"How It Works" =>
        "<ol>
          <li>The EcoSac is currently manufactured in Dakar, Senegal, by a team of four tailors employed by SEM Fund, three of whom are women.</li>
          <li>Once constructed, the product is sold to women’s groups’ presidents who sell them to their members for a commission.</li>
          <li>For each EcoSac sold, the presidents can make between $1.50 - $2 US dollars, providing an additional source of income.</li>
          <li>Under this project, SEM Fund will train and mentor 10 new women entrepreneurs for a minimum of six months, and support the creation of a market for clean energy household products.</li>
          <li>Families spend less money on cooking, women have more time to devote to their own personal development, and a chance to earn cash to potentially start their own businesses!</li>
        </ol>",
        :"Why It's Important" => "The average household income in rural Senegal is less than $3/day with between 15% and 30% spent on household cooking and lighting products. The EcoSac provides an affordable alternative that is not only more efficient and safer for family health, but is also an income generator for women leaders in the community.",
        :"Sustainability" => "SEM Fund’s EcoSac is sustainable because it is paired with a community-led and managed distribution process. External funds are used to support the business and leadership skills development of new women’s groups, but the ongoing promotion and use of the EcoSac will be driven by women in the community who are motivated to generate their own income.",
        :"Sample Of Gift Items" => "Introductory EcoSac Training for 1 Woman
        <ul class='disc'>
          <li>
            Materials
            <ul class='disc'>
              <li>Business Management Training</li>
              <li>Marketing and Communications Training</li>
              <li>Business Mentoring Visits</li>
              <li>Promotional Marketing Events</li>
              <li>Marketing tools</li>
            </ul>
          </li>
        </ul>"
      }
    )

Project.find_or_create_by(name: "Complete Wangama's Clinic").update(name: "Complete Wangama's Clinic", 
      organization_id: Organization.find_by_name("Heartfully").id, 
      funding_goal: 1234.32,
      city: "Tanzania", 
      country: "Africa",
      banner_img: "assets/katelyn_and_brandon/katelyn_and_brandons_project_photo.png", 
      public: false)

Project.find_or_create_by(name: "Light Up The Night With A Solar Campaign For Zambian Families").update( 
      name: "Light Up The Night With A Solar Campaign For Zambian Families", 
      partner: "SolarAid",
      description: "This campaign will bring access to solar energy to school children and their families at eight schools in Zambia's Central Province.",
      organization_id: Organization.find_by_name("SolarAid").id, 
      funding_goal: 3000,
      city: "Zambia",
      country: "Africa",
      url_slug: "solar-aid-solar-energy",
      project_photo: "marissa_and_travis/marissa_and_travis_project_photo.jpg",
      project_photo_2: "marissa_and_travis/full_participation_package.jpg",
      project_photo_3: "marissa_and_travis/room_and_board_for_assistants.jpg",
      extra_content: {
        :"The Problem" => "Seven out of ten people in Zambia have no access to electricity. Without it, families are dependent on alternatives like burning kerosene. The black smoke a kerosene lamp emits pollutes the environment and its expensive price keeps families locked in a cycle of poverty.",
        :"The Opportunity" => "Light up the night and help bring access to solar energy to school children and their families across eight schools in Zambia’s Central Province. Specifically, this registry has the opportunity to:
        <ul class='disc'>
          <li>Give 7,519 people access to solar lights.</li>
          <li>Provide 1,491,335 study hours to children.</li>
          <li>Save families $248,494 in fuel costs.</li>
          <li>Avert 646 tons of carbon dioxide emissions.</li>
          <li>Improve the respiratory health of 4,310 people by transitioning to a clean light source.</li>
        </ul>",
        :"How It Works" => "SolarAid is working to eradicate the kerosene lamp from Africa by 2020 by selling solar lights through its social enterprise, SunnyMoney. By selling lights, not giving them away, they are establishing a solar market which will light up an entire continent and leave a lasting energy legacy.
        <ol>
          <li>Through a unique community distribution model, headteachers are trained and empowered to raise trust and communicate the benefits of solar power to parents.</li>
          <li>Parents are able to purchase a solar light at a promotional price and as each light shines in the night, it attracts neighbors and in turn the demand for solar lights grows.</li>
          <li>This sparks the market conditions required for local shops and independent agents to sell solar lights, which supports job creation and ensures money stays in the local economy.</li>
        </ol>",
        :"Why It's Important" => "Better health: Over 50% of families show signs of improvement in health after switching from kerosene and paraffin to solar lights. Productivity: Solar lights allow students to read under clean light and for an extra hour each evening as well as enabling work and meal preparation after sunset. Savings: Families recover their investment in a solar light, that can last 5 years, in just 10 weeks – allowing for a more prosperous future. Environmentally Smart:  Solar lights in the household can reduce CO₂ emissions by up to 440 pounds per year.
        <br />
        <br />
        <strong>Productivity:</strong> Solar lights allow students to read under clean light and for an extra hour each evening as well as enabling work and meal preparation after sunset.
        <br />
        <br />
        <strong>Savings:</strong> Families recover their investment in a solar light, that can last 5 years, in just 10 weeks – allowing for a more prosperous future.
        <br />
        <br />
        <strong>Environmentally Smart:</strong> Solar lights in the household can reduce CO₂ emissions by up to 440 pounds per year.",
        :"Sustainability" => "The SolarAid social enterprise model is steadily progressing towards sustainability through the creation of long-lasting markets for solar lights. It also generates jobs, saves money and increases productivity by harnessing the world’s most sustainable form of energy – solar power!",
        :"Sample Of Gift Items" =>
        "<ul class='disc'>
          <li>Campaign launch meetings</li>
          <li>Solar light marketing bundle (sample lights, radio ads, banners, posters, flyers)</li>
          <li>Solar light delivery</li>
          <li>Project monitoring and evaluation</li>
        </ul>"}
    )
Project.find_or_create_by(name: "Train rural community health workers to provide home-based care in Tanzania").update(
      name: "Train rural community health workers to provide home-based care in Tanzania", 
      partner: "Mufindi Orphans Project",
      description: "The Home-Based Care Program is a 21-day seminar to train community health workers on a variety of health topics, with a focus on HIV prevention, care and treatment.",
      organization_id: Organization.find_by_name("Mufindi Orphans").id,
      funding_goal: 5500,
      city: "Tanzania",
      country: "Africa", 
      url_slug: "mufindi-orphans-health_training",
      project_photo: "matt_and_lindsey/matt_and_lindsey_project_photo.jpg",
      project_photo_2: "projects/home-based-care/photo_2.jpg",
      project_photo_3: "projects/home-based-care/photo_3.jpg",
      extra_content: {
        :"The Problem" => "Although great improvements have been made over the past decade in HIV prevention, care and treatment in Tanzania, Iringa region remains one of the highest affected with an HIV prevalence of 9.1%.",
        :"The Opportunity" => "With proper training, community health workers can become a critical part of curbing new HIV infections, dispelling health myths and misconceptions, and ensuring those living with HIV access and adhere to treatment.",
        :"How It Works" =>
        "<ol>
          <li>22 community volunteers are selected for a three-week training on a diverse array of health topics.</li>
          <li>Following the training, the newly certified community health workers report to their local health center to receive their client list predominantly comprised of people living with HIV/AIDS.</li>
          <li>Each week, the trained community health workers visit their clients and spreads accurate health knowledge to empower their community.</li>
          <li>Accurate health knowledge and treatment is brought to people’s homes, thereby reaching the most vulnerable groups who might otherwise not seek help at a health facility.</li>
        </ol>",
        :"Why Its Important" => "Unlike their facility-based counterparts, community health workers are able to couple their clinical skills with a deep rooted understanding of and respect for local culture and traditions. From wound cleaning, to HIV/AIDS counseling, to educating families about maternal and child health, home-based care volunteers are making a real impact in their communities.",
        :"Sustainability" => "The training is conducted by Tanzanian medical professionals to local Tanzanian community volunteers, allowing for education to spread throughout the community at a grassroots level.  This education ultimately travels to neighbors and friends as the volunteer builds trust within their community.  This leads to healthier parents and children.  In the long term, a healthy household means more food on the table and more opportunities for education and income generation.",
        :"Sample Of Gift Items" =>
        "<ul class='disc'>
          <li>
            Daily health facility costs for training
            <ul class='disc'>
              <li>Venue rental</li>
              <li>Medical supplies</li>
            </ul>
          </li>
          <li>
            Course Materials
            <ul class='disc'>
              <li>Participant workbook</li>
              <li>Counseling job aids and posters</li>
              <li>Health promotion packets (flyers, brochures)</li>
            </ul>
          </li>
          <li>Training Participant Room and Board</li>
          <li>Training modules</li>
        </ul>"
      }
    )

name = Project.where('name LIKE ?', '%1').first.name
Project.find_or_create_by(name: name).update(public: false)
puts "====== finish ======="