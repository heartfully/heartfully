  Project.create([
    { 
      name: "Launch Three Preschool Programs In Tanzania",
      partner: "Mufindi Orphans Project",
      description: "This preschool program transforms outdated classrooms into a place where young children can receive better education for their age level and compassionate support from teachers.",
      organization_id: Organization.find_by_name("Mufindi Orphans").id,
      funding_goal: 4500,
      city: "Tanzania",
      country: "Africa",
      url_slug: 'mufindi-orphans-build-preschool',
      project_photo: 'homepage/mufindi-large.jpg',
      project_photo_2: 'projects/preschool_program/photo_2.jpeg',
      project_photo_3: 'projects/preschool_program/photo_3.jpg',
      extra_content: {
        :"The Problem" => "Teachers in Tanzania deal with minimal training, a lack of classroom supplies, dire classroom conditions, large classroom sizes (sometimes up to 100 students!) and little community support. This results not only in poor learning outcomes for students, but teacher burn-out which perpetuates the low teacher-to-student ratio.",
        :"The Opportunity" => "In 2010, the Early Childhood Education Department began to address a pressing need for young children to have a safe and stimulating environment to grow in mind and body. This program offers working parents a place for their children to receive nutritious food, age-appropriate education and a compassionate and loving environment.",
        :"How It Works" => 
        "<ol>
          <li>The Mufindi Orphans Project works with local communities to identify and  select a preschool class to participate in the outreach program.</li>
          <li>After a needs assessment, minor renovations or repairs are made as part of the classroom transformation.</li>
          <li>Learning materials are purchased and set up in the classroom to create a supportive learning environment. Each classroom has five sections for children ranging in age from 3-7 years old: practical life, sensorial, math, language and culture and science. All materials are at the children's level to take and use as they please.  This school uses an 'interactive' approach, using locally made materials for students to explore and play with.</li>
          <li>Mufindi staff conduct follow-up visits to ensure the new classroom materials are being used appropriately and are well-maintained.</li>
          <li>The community, teachers and students get to enjoy a transformed learning space for years to come!</li>
        </ol>",
        :"Why It's Important" => "The outreach program helps schools with the skills and tools they need to educate their children and to provide a loving environment for children to learn creativity, kindness, problem solving strategies, and of course reading, writing and arithmetic.",
        :"Sustainability" => "Sustainability is a key pillar to this program’s success. Communities pay for their kindergarten teacher's wage and institute school lunch programs funded by the parents.  In exchange, the Mufindi Orphans Project funds teacher training, classroom materials and renovations. They also walk side-by-side with community partners throughout the year to ensure all children are getting the best possible access to education and care.",
        :"Sample Of Gift Items" =>
        "<ul class='disc'>
          <li>Classroom renovations and repairs</li>
          <li>Tables and chairs</li>
          <li>Bookshelves</li>
          <li>Woven mats for story time</li>
          <li>Blankets (Mufindi can get quite cold!)</li>
        </ul>"
      }
    },

    # Provide abandoned girls in Kenya with loving homes and education
    {
      name: "Provide abandoned girls in Kenya with loving homes and education",
      partner: "Many Hopes",
      description: "Help an orphaned or abandoned girl thrive by providing her with safe housing and an excellent education.",
      organization_id: Organization.find_by_name("Many Hopes").id, 
      funding_goal: 4000,
      city: "Kenya",
      country: "Africa",
      url_slug: "many-hopes-girls-education",
      project_photo: "projects/girls-education/project_photo.jpg",
      project_photo_2: "projects/girls-education/photo_2.jpg",
      project_photo_3: "projects/girls-education/photo_3.jpg",
      extra_content: {
        :"Background" => "There are 2.6 million children living on the streets of Kenya. Coastal Kenya has one of the lowest levels of education standards in the country, and one of the highest levels of child prostitution. These facts are not a coincidence. The town Many Hopes work nearest to has grown fifteen fold in the last 15-20 years largely due to a sex-tourism and prostitution boom.
        <br />
        <br />
        Unfortunately, girls often feel they have no option but to prostitute themselves. When we asked one girl, “Why are you doing this, you know there is HIV in Kenya, right?” she replied, “AIDS might kill me in five years but I have to eat tomorrow.",
        :"The Opportunity" => "Rescue, house and educate young girls.
        <br/>
        <br/>
        Many Hopes’ homes are built to cultivate a family atmosphere as opposed to an ‘orphanage’ atmosphere by:
        <ul class='disc'>
          <li>Limiting each home to a maximum of 15 children spread across 4 spacious bedrooms</li>
          <li>Ensuring each home is comprised of children of mixed ages ranging infants to teenagers</li>
          <li>Having a Kenyan housemother and assistant housemother resident in each home</li>
        </ul>
        Many Hopes creates conditions for healing and academic excellence by:
        <ul class='disc'>
          <li>Enrolling girls in private English speaking elementary schools</li>
          <li>Designing homes with ample study and homework space, library facilities, and living and playing space</li>
          <li>Providing a full-time teacher on staff to help with homework and tutoring on evenings and weekends</li>
          <li>Providing a full-time child psychologist on staff to provide counseling and accelerate healing</li>
        </ul>",
        :"How it works" => "Many Hopes is a long-term strategic solution to the complex problem of extreme poverty. A network of children who were born into extreme poverty will grow up with the education, confidence, and community to defeat the causes of that poverty as adults. Children who have suffered the worst of injustice will be equipped to lead justly and defeat the corruption that caused their suffering. Children from the streets will grow up in loving homes, be educated in excellent schools alongside the children of influential families, and be the network that defeats the extreme poverty around them.
        <br />
        <br />
        Many Hopes does this in 3 ways:
        <ol>
          <li>Rescue and housing: Rescuing children from situations of abuse and providing them with a loving home.</li>
          <li>Education: Educating children from extreme poverty with children from wealth, so they grow up as a network of influencers committed to justice.</li>
          <li>Legal and policy: Using cases from children in our homes to force government to create or enforce national legislation protecting the poor.</li>
        </ol>",
        :"Why is it important?" => "We can continue to give aid to corrupt or inept governments for as long as we want and expect them to behave differently. But history tells us that they will not. The next generation of leadership will be from the same small pool of families far removed from the realities of the near 60% of Kenyans living below the poverty line.
        <br />
        <br />
        Nobody wants Kenya to be different, to be better, more than the children in our homes who have suffered the worst of it. If we can give them the education in their heads, the confidence in their bellies, and the network of each other at their fingertips, they will grow to be a generation of influencers who can do work that no international programs could ever accomplish.",
        :"Sustainability" => "Many Hopes creates local business to sustain what charitable dollars build. Every project will sustain itself within 10 years. All charitable dollars support new homes and new schools. Ultimately, Many Hopes can replicate in other communities.",
        :"Sample Of Gift Items" => 
        "<ul class='disc'>
          <li>Education for one girl for one month</li>
          <li>Food and education for one girl for one month</li>
          <li>Health care for girl for one year</li>
        </ul>"
      }
    },

    # Bring Electricity To a Vocational School For Vulnerable Children In Tanzania
    {
      name: "Bring Electricity To a Vocational School For Vulnerable Children In Tanzania",
      partner: "Mary Ryan Foundation",
      description: "This project will provide a source of sustainable income for a vocational school serving at-risk youth in Tanzania and improve the quality and range of education available by equipping it with electricity.",
      organization_id: Organization.find_by_name("The Mary Ryan Foundation").id, 
      funding_goal: 5000,
      city: "Tanzania",
      country: "Africa",
      url_slug: "maryryanfoundation-vocational-school",
      project_photo: "homepage/project_3.jpg",
      project_photo_2: "projects/mary-ryan/photo_2.jpg",
      project_photo_3: "projects/mary-ryan/photo_3.jpg",
      extra_content: {
        :"The Problem" => "Out-of-school youth living in rural Tanzania have very few opportunities to develop income generating skills in a safe and supportive environment. In those rare communities trying to initiate vocational schools for these underserved children, the lack of electricity and infrastructure limit the ability of the school to generate enough income to cover operational costs and provide a quality education for its students.",
        :"The Opportunity" => "The Mary Ryan Foundation is improving access to educational opportunities for over 80 disadvantaged youth in Mbeya, Tanzania through its  vocational school in Ilembo. In 2014, Ilembo was one of many rural villages added to the electric grid system in the country. Unfortunately, high installation and equipment costs have prevented most of the population from accessing this electricity. Bringing electricity and high quality electric-run products to the vocational school will expand opportunities to initiate new skills training for students and boost the school's ability to become self-sustaining.",
        :"How It Works" => "<strong>Step 1:</strong> Power it up! The Mary Ryan Foundation Committee of Ilembo will oversee the installation of electricity at the vocational school in close coordination with the local government leaders. Designated committee members will also ensure the purchase, safe transport, and proper maintenance of the new equipment and supplies.
        <br />
        <br />
        <strong>Step 2:</strong> Any child or adolescent can enroll in the school and select their area of interest including sewing, carpentry, and masonry. Those who do not have the means to pay the minimal school fee are admitted free of charge.
        <br />
        <br />
        <strong>Step 3:</strong> Students are treated with respect and are welcomed as part of the community. They attend all-day classes five days per week just like their secondary school counterparts. Students also benefit from trainings on business and accounting, health education (including HIV prevention), and volunteer periodically at the community health center.
        <br />
        <br />
        <strong>Step 4:</strong> Students are trained on the new equipment by certified teachers. MRF Committee members also actively promote the new services available to the community which were previously not there, such as electric-powered wood cutting and sewing.
        <br />
        <br />
        <strong>Step 5:</strong> Community members pay to use the vocational school’s new wood cutting and machine and place orders with the school for clothing, construction and carpentry.
        <br />
        <br />
        <strong>Step 6:</strong> People of Ilembo get items and services they need while supporting vulnerable youth in their communities – quite an electrifying combo!",
        :"Why It's Important" => "Out-of-school youth are more likely to get into risky behaviors or run away from home to chase down a better life in “the city”. This often leads to homelessness, theft, HIV infection,  unwanted pregnancies, or worse.  Ilembo’s vocational school offers a healthy and fulfilling alternative in the form of valuable income generating and life skills, and a safe environment for youth to come together and build a better future for themselves. It is the first school of its kind in the area, and has been well-received by students, parents/caretakers, community leaders, and district officials. Many graduates of the school now own and operate their own businesses and are supporting themselves and their families.",
        :"Sustainability" => "Sustainability is the name of the game for this project. In 2012, the Mary Ryan Foundation Committee of Ilembo developed a five-year sustainability action plan for the vocational school. Each year, external support is reduced, while the community’s contributions increase by using profits from selling furniture and construction to cover the operating costs. Initial funding for the school to obtain electricity will expand long-term opportunities to initiate new vocational skills training for students while boosting the school’s income and ability to stay on track toward sustainability.",
        :"Sample Of Gift Items" => 
        "Electricity installation supplies
        <ul class='disc'>
          <li>Sockets</li>
          <li>Breakers</li>
          <li>Wires</li>
          <li>Nuts n'bolts</li>
        </ul>
        People power
        <ul class='disc'>
          <li>Engineers</li>
          <li>Electricians</li>
        </ul>"
      }
    },

    # Sponsor a Girl's Education In Tanzania
    {
      name: "Sponsor a Girl's Education In Tanzania",
      partner: "Jiamini",
      description: "Fund a girl’s high school education and provide her with a safe living environment and opportunities for higher education and employment.",
      organization_id: Organization.find_by_name("Jiamini").id, 
      funding_goal: 3100,
      city: "Tanzania",
      country: "Africa",
      url_slug: "jiamini-girls-education",
      project_photo: "projects/jiamini-girls-education/project_photo.jpg",
      project_photo_2: "projects/jiamini-girls-education/photo_2.jpg",
      project_photo_3: "projects/jiamini-girls-education/photo_3.jpg",
      extra_content: {
        :"Background" => "Jiamini scholars are selected based on academic dedication and financial need. They are passionate, dedicated students and without sponsorship they would have no way to pay for school. By funding a student’s education you provide him or her with opportunities for higher education and employment that would otherwise be out of reach.",
        :"Impact" => "Empowering girls through education transforms societies. Sponsoring a Jiamini girl will forever change her life and have a ripple effect on her family and community.",
        :"How It Works" => "While the schools Jiamini works with are public, they are not completely free. In Tanzania, school fees and other educational expenses act as barriers to the poorest students, often meaning they have to drop out of school entirely.
        <br />
        <br />
        With this everlasting gift, donors will receive letters from their student and have the opportunity to build a personal relationship with her. This sponsorship will cover her complete educational expenses for the duration of secondary school, and put her in a safe living environment, where she can focus on learning.",
        :"Sample Of Gift Items" => 
        "<ul class='disc'>
          <li>Textbooks</li>
          <li>Room and Board</li>
          <li>School Supplies</li>
          <li>Tutoring</li>
        </ul>"
      }
    },

    # Send a Star Student To High School In Tanzania 
    {
      name: "Send a Star Student To High School In Tanzania",
      partner: "Jiamini",
      description: "Fund a student’s high school education and provide him or her with opportunities for higher education and employment that would otherwise be out of reach.",
      organization_id: Organization.find_by_name("Jiamini").id, 
      funding_goal: 1600,
      city: "Tanzania",
      country: "Africa",
      url_slug: "jiamini-student-scholarship",
      project_photo: "projects/student-scholarship/project_photo.jpg",
      project_photo_2: "projects/student-scholarship/photo_2.jpg",
      project_photo_3: "projects/student-scholarship/photo_3.jpg",
      extra_content: {
        :"Background" => "Jiamini scholars are selected based on academic dedication and financial need. They are passionate, dedicated students and without sponsorship they would have no way to pay for school. By funding a student’s education you provide him or her with opportunities for higher education and employment that would otherwise be out of reach.",
        :"Impact" => "Sponsoring a Jiamini Scholar will forever change their life and have a ripple effect on their families and communities.",
        :"How It Works" => "While the schools Jiamini works with are public, they are not completely free. In Tanzania, school fees and other educational expenses act as barriers to the poorest students, often meaning they have to drop out of school entirely.
        <br />
        <br />
        With this everlasting gift, donors will receive letters and regular updates from their student and have the opportunity to build a personal relationship with him or her. This sponsorship will cover a student’s complete educational expenses for all four years of high school. </i>",
        :"Sample Of Gift Items" => 
        "<ul class='disc'>
          <li>Textbooks</li>
          <li>Uniform</li>
          <li>School Supplies</li>
          <li>Tutoring</li>
        </ul>"
      }
    },

    # Refurbish damaged classrooms in Tanzania
    {
      name: "Refurbish damaged classrooms in Tanzania",
      partner: "Jiamini",
      description: "Avoid the disruption of education for hundreds of studenta in Southern Tanzania by supporting the emergency repairs of four classrooms.",
      organization_id: Organization.find_by_name("Jiamini").id, 
      funding_goal: 500,
      city: "Tanzania",
      country: "Africa",
      url_slug: "jiamini-renovations",
      project_photo: "projects/classroom-renovations/project_photo.jpg",
      project_photo_2: "projects/classroom-renovations/photo_2.jpg",
      project_photo_3: "projects/classroom-renovations/photo_3.jpg",
      extra_content: {
        :"Background" => "Nangwanda Secondary School is one of two secondary schools in Newala, Tanzania. Several of their classrooms are in disrepair and in some cases dangerous to students.
        <br />
        <br />
        The administrators at Nangwanda are seeking help in refurbishing these classrooms, making them safe places to learn that students can be proud of – ultimately improving their academic performance.
        <br />
        <br />
        With your support, we can repair cracked walls, replace collapsing ceiling tiles, and install new window frames, doors, and blackboards.",
        :"Impact" => "All students deserve safe places to learn.
        <ul class='disc'>
          With this registry you can:
          <li>Help a secondary school make essential repairs to their facilities</li>
          <li>Provide hundreds of students with safe classrooms that they can be proud of</li>
          <li>Give local craftspeople valuable work</li>
        </ul>",
        :"How It Will Work" =>
        "The classroom refurbishment project will provide a profound return for a small investment.
        <br />
        <br />
        <ol>
          <li>Jiamini will work with local tradespeople to refurbish each classroom--patching cracked walls and floors, and installing new window frames, doors, and blackboards.</li>
          <li>Students will contribute by helping paint the classrooms.</li>
          <li>Jiamini will oversee the work to ensure a high quality of craftsmanship and that budget is spent exactly as intended.</li> 
        </ol>
        <br />",
        :"Sample Of Gift Items" =>
        "<ul class='disc'>
          <li>
            Build a Floor!
            <ul class='disc'>
              <li>Bags Of Cement</li>
              <li>Transport</li>
            </ul>
          </li>
          <li>
            Beautify the exterior!
            <ul class='disc'>
              <li>Cream Paint</li>
              <li>Black Paint</li>
            </ul>
          </li>
          <li>
            Let there be light - windows!
            <ul class='disc'>
              <li>Wood Frames</li>
              <li>Light Blue Paint</li>
              <li>Wire Mesh</li>
            </ul>
          </li>
        </ul>"
      }
    },

    # Bring Early Childhood Education to Rural Communities
    {
      name: "Bring Early Childhood Education to Rural Communities",
      partner: "Olive Branch for Children",
      description: "The Montessori Outreach Program transforms members of Tanzania’s most remote villages into teachers who are equipped to deliver high-quality kindergarten education to the children in their communities.",
      organization_id: Organization.find_by_name("Olive Branch for Children").id, 
      funding_goal: 5500,
      city: "Tanzania",
      country: "Africa",
      url_slug: "olive-branch-teacher-training",
      project_photo: "projects/teacher-training/project_photo.jpg",
      project_photo_2: "projects/teacher-training/photo_2.jpg",
      project_photo_3: "projects/teacher-training/photo_3.jpg",
      extra_content: {
        :"The Problem" => "Early childhood education services—such as kindergarten and preschool—are not provided by the Tanzanian government in the majority of rural communities. This results in missed opportunities for the country’s most vulnerable youth to develop their academic foundations and skills before entering primary school. Children who do not receive early childhood education often have negative attitudes towards school, which can lead to low attendance rates throughout their primary school years.",
        :"The Opportunity" => "The Olive Branch for Children developed a Montessori Outreach Program that brings quality early childhood education to Tanzania’s most vulnerable and hard-to-reach areas. Compared to traditional didactic teaching methods, the Montessori methodology is interactive, encourages self-discipline and independence, and fosters respect within the classroom.",
        :"How it Works:" => 
        "<strong>Step 1:</strong> The Olive Branch for Children hosts an intensive, 15-day Montessori education seminar focusing on Montessori methodology, material making, and classroom management.
        </br/>
        <strong>Step 2:</strong> After the training, Montessori teachers return to their communities equipped with the most up-to-date knowledge and skills and have the option to either: a) continue teaching at the existing Montessori outreach classroom; or b) with the support of their community, open a new Montessori Kindergarten classroom.
        <br />
        <strong>Step 3:</strong> Olive Branch trainers provide all teachers with monthly in-class assessments and feedback sessions, as well as monthly follow-up trainings.
        <br />
        <strong>Step 4:</strong> 35 outstanding citizens are transformed into teachers who have the confidence, skills and support to provide Montessori education to hundreds of students in their communities!",
        :"Why it's important" => "The Montessori Outreach Program ensures that children receive a positive first experience with education and build a love for school.  This is essential, since many children will face major challenges just walking to their local primary school once they transition.  The more they love education, the more committed they will be to pursuing it.  In addition, the children moving on from the enrolled Montessori schools developed by the Olive Branch are typically the highest performing students in their primary schools.",
        :"Sustainability" =>
        "<ul class='disc'>
          <li><i>Community support:</i> The schools enrolled in the Montessori Outreach Program are all 100 percent owned and operated by their respective communities. All Montessori Kindergartens registered in the program have school committees, and are represented at the village level by a Community Advisory Committee.</li>
          <li><i>Training model:</i> After the initial training, the Montessori Outreach Program continues to build the capacity of the strongest teachers within the program to function as mentors for new and struggling teachers. In addition, the Olive Branch’s trainers are volunteers, offering their services free of charge.</li>
        </ul>",
        :"Sample Of Gift Items" =>
        "<ul class='disc'>
          <li>
            Participation support for teachers
            <ul class='disc'>
              <li>Room and board for 15 days</li>
              <li>Transport to/from villages for training</li>
            </ul>
          </li>
          <li>
            Classroom Materials
            <ul class='disc'>
              <li>Math/Science</li>
              <li>Language</li>
              <li>Sensorial and Practical Life</li>
            </ul>
          </li>
          <li>Training tools and materials</li>
        </ul>",
        :"Info Box" => 
          "<iframe width='100%' height='315' src='https://www.youtube.com/embed/IuN7qQrqMK8' frameborder='0' allowfullscreen></iframe>"
      }
    },

    # Provide families in India with safe and affordable clean cookstoves
    {
      name: "Provide families in India with safe and affordable clean cookstoves",
      partner: "Greenway",
      description: "This campaign in northern India will equip families with clean cookstoves to improve household health, lower greenhouse gas emissions and reduce both time and money spent on purchasing or collecting fuel.",
      organization_id: Organization.find_by_name("Greenway").id,
      funding_goal: 1500,
      city: "India",
      country: "Asia",
      url_slug: "greenway-clean-cookstoves",
      project_photo: "projects/greenway/project_photo_1.jpeg",
      project_photo_2: "projects/greenway/project_photo_2.jpeg",
      project_photo_3: "projects/greenway/project_3.png",
      extra_content: {
        :"The Problem" => "The current practice of cooking on mud stoves with open indoor fires poses a significant health risk to women in South Asia. Air pollution in the household is a massive challenge in India, leading to approximately 875,000 deaths annually. Mud stoves are also significant contributors to climate change due to their harmful greenhouse gas emissions. In spite of these health and environmental risks, mud stoves continue to be used by nearly two-thirds of India’s households.  Lack of access to modern cooking technologies, affordability, and awareness are just some of the reasons perpetuating this widespread practice.",
        :"The Opportunity" => "The provision of clean cookstoves, paired with excellent training by Greenway, has the opportunity to reduce the risks associated with traditional cooking on individual, family and community health.",
        :"How it works" => 
        "<strong>Step 1:</strong> Greenway will select a community in the <a href='http://en.wikipedia.org/wiki/Kutch_District' target='_blank'>Kutch district</a> that relies on traditional cooking methods and lead a seminar with women in this area.
          <br>
          <br>
          <strong>Step 2:</strong> Participants will leave the seminar with an understanding of how the clean cookstoves work, its benefits compared to traditional methods, and hands on experience testing the improved stoves.
<br>
<br>
<strong>Step 3:</strong> Women who sign up to receive a free clean cookstove will also take part in a follow-up training on the day of the stove’s delivery.<br><br>
          <strong>Step 4:</strong> During this training, women practice cooking on the clean cookstove with the support of Greenway's team and discuss any questions and challenges before taking it home.<br><br>
          <strong>Step 5:</strong> Clean, safe and improved cooking commences!",
        :"Why It’s Important" => 
        "<ul class='disc'>
          <li>Women and girls in India spend a significant portion of their day preparing multiple meals under dangerous conditions.  Clean cookstoves can avert unnecessary death and injury to women in the home while providing the same healthy meals to their families.</li>
          <li>The economic and environmental benefits are also impressive; clean cookstoves reduce emissions by 70% and fuel consumption by 65% without any change in cooking patterns and taste.</li>
        </ul>",
        :"Sustainability" => "Cooking is a huge part of a family’s daily life around the world, and India is no exception. As the initial group of families engaged in this campaign uses clean cookstoves, they will also witness firsthand the improvements to their quality of life. This group will then spread the word about their positive experiences with clean cookstoves to neighbors, friends and extended family. Greenway envisions this cycle of demand generation to eventually result in more and more people adopting this practice in the future by directly purchasing clean cookstoves. Think of it as a giant, healthy tidal wave of behavior change…that also brings delicious food. Win-win for all!",
        :"Sample Of Gift Items" => 
        "Clean Cookstoves:
        <ul class='disc'>
          <li>Individual Smart Stove</li>
          <li>Individual Jumbo Stove</li>
        </ul>
        Clean cookstove training package for 5 women
        </ul>"
      }
    },

    # Develop a New Generation of Youth Entrepreneurs in Senegal
    {
      name: "Develop a New Generation of Youth Entrepreneurs in Senegal",
      partner: "SEM Fund",
      description: "This entrepreneurship program expands job opportunities for young people in Senegal and makes clean, affordable energy products accessible to those who need them most.",
      organization_id: Organization.find_by_name("SEM Fund").id,
      funding_goal: 7500,
      city: "Senegal",
      country: "Africa",
      url_slug: "semfund-youth-entrepreneurship",
      project_photo: "projects/youth-entrepreneurship/project-photo.jpg",
      project_photo_2: "projects/youth-entrepreneurship/project_photo_2.jpg",
      project_photo_3: "projects/youth-entrepreneurship/project_photo_3.jpg",
      extra_content: {
        :"The Problem" => "In Senegal, over 50% of youth are unemployed or working in the informal sector. This can lead to dangerous living conditions, and begin a cycle of poverty that could last a lifetime. Currently, there is also a lack of affordable, acceptable alternative energy products in Senegal. This results in the widespread use of costly, inefficient products that are harmful to individual health and the environment.",
        :"The Opportunity" => "SEM Fund’s youth entrepreneurship program is an opportunity to promote jobs and develop business skills for young people while expanding access to clean energy.",
        :"How It Works" => 
        "<ol>
          <li>SEM Fund recruits 15 to 20 young entrepreneurs (ages 18 to 25) per cohort.</li>
          <li>These individuals participate in a 5-day training that emphasizes business, marketing, and accounting, and the impact of energy on development. The training also discusses how to address common barriers they might face in growing their business, ranging from accessing cheaper transport to the market, to partnering with other businesses.</li>
          <li>Upon completion of the training, they are given clean energy products on consignment, which they pay for once they have sold. These include: the Solar lamp, Clean Cookstove, Efficient Fuel, and EcoSac.</li>
          <li>SEM Fund then follows up each new entrepreneur with regular mentoring and support visits over a six month cycle. During these visits, SEM Fund checks in on their stock, discusses any client feedback they may have, and revisits business plans to re-evaluate how they might grow as an enterprise.</li>
          <li>For each product sold, youth entrepreneurs receive a commission between $1.50 and $7.00.</li>
        </ol>",
        :"Why It's Important" => "The training and mentoring cycle for new youth entrepreneurs brings much needed skills and reliable income to out-of-school youth that would otherwise be out of their financial or geographical reach.  As an added bonus, products these youth are introducing to other Senegalese households also bring impressive results:
        <br />
        <br />
        <ul class='disc'>
          <li><i>Solar Lamp:</i> The solar lights on average reduce household expenditures by 25%, increase children's study time by 75%, and reduce 115 kg of CO2 emissions per household per year.</li>
          <li><i>Clean Cookstove:</i> Each average-sized clean cookstove, reduces household fuel expenditures by 30%, reduces 4,637 tonnes of CO2 per year and significantly reduces the emissions of deadly indoor air pollutants. These pollutants cause more deaths per year than malaria, AIDS and TB combined. (World Health Organization, 2014)</li>
          <li><i>Efficient Fuel:</i> The biomass reduces environmental degradation as it made from wood that naturally dies. It also promotes rural-urban linkages, reduces the time burden of fuel collection (particularly for women), and decreases fuel expenditures by at least 30%.</li>
          <li><i>EcoSac:</i> This affordable cooking sack reduces the time spent cooking (which on average takes 3.5 hours in Senegal) by about an hour per meal. This decreases exposure to indoor air pollutants and money spent on fuel, while also leaving time and energy for women—who are typically the primary household cook—to do other activities.</li>
        </ul>",
        :"Sustainability" => "During the training, entrepreneurs receive support in building their business plan to ensure that they have a clear path to success. Each training and marketing event also gives them a chance to build a network of clean energy entrepreneurs throughout Dakar and the surrounding area, and an opportunity to expand their client base. These new skills will last well beyond the length of this project, provide a sustainable source of income, and can be applied to other business endeavors in the future.",
        :"Sample Of Gift Items" => 
        "Products to get the entrepreneurs started
        <ul class='disc'>
          <li>Solar Lamps</li>
          <li>Clean Cookstoves</li>
          <li>Efficient Fuel</li>
          <li>EcoSacs</li>
        </ul>
        Support for trainings and events
        <ul class='disc'>
          <li>5-day Business and Marketing training package for 1 youth</li>
          <li>1-day Promotional Marketing Events</li>
          <li>Business Mentoring Visits for 1-on-1 support</li>
        </ul>"
      }
    },

    # Bring high-quality medical care to vulnerable populations in rural Guatemala
    {
      name: "Bring high-quality medical care to vulnerable populations in rural Guatemala",
      partner: "HELPS International",
      description: "Bring free, high-quality medical care to those in need by supporting a medical mission that serves the most vulnerable populations of Guatemala.",
      organization_id: Organization.find_by_name("HELPS International").id,
      funding_goal: 5000,
      city: "Guatemala,",
      country: "Central America",
      url_slug: "helpsinternational-medical-mission",
      project_photo: "projects/helps-medical/project_photo.jpg",
      project_photo_2: "projects/helps-medical/project_photo_2.png",
      project_photo_3: "projects/helps-medical/project_photo_3.jpg",
      extra_content: {
        :"The Problem" => "Half of Guatemala’s population lives below the poverty line, and nearly 16% live in extreme poverty. Already limited existing healthcare services are largely inaccessible to the masses due to financial barriers.",
        :"The Opportunity" => "HELPS International has developed a system that dispatches volunteer medical teams to address the healthcare crisis in rural areas of Guatemala. These services are provided free of charge to those in need.",
        :"How It Works" =>
        "<ol>
          <li>The volunteer medical teams for HELPS missions are comprised of about 90 members, ranging from physicians and surgeons to nurses and support staff.</li>
          <li>During a mission, surgical and medical volunteers set up shop in vacant hospitals, filling empty rooms with drugs, supplies and other medical equipment to provide healthcare services that are as close as possible to U.S. quality standards..</li>
          <li>HELPS medical teams are then fully equipped with drugs, supplies and other medical equipment to provide healthcare services that are as close as possible to US quality standards.</li>
          <li>Free healthcare is accessible to all Guatemalans, regardless of income level enabling lives to be saved and long-term disabilities averted.</li>
        </ol>",
        :"Why It's Important" => "Latin America is in the midst of an ongoing healthcare crisis. Not only can most of the population not afford healthcare, but due to a shortage in trained health workers, families frequently seeking medical services often find their local hospitals not adequately staffed or equipped to handle their cases.",
        :"Sustainability" => "HELPS’ Medical Program began in 1988 when an eight-member U.S. plastic surgery team traveled to a village in the northern highlands of Guatemala. With inadequately staffed hospitals already situated in remote areas of the Guatemalan highlands, HELPS worked in cooperation with the Guatemalan government to make use of these facilities. The HELPS medical teams quickly gained momentum, spreading through Guatemala and covering a much larger area of the country. Since then, the programs have grown immensely, gaining the support needed to move beyond the walls of the hospitals. Today, HELPS’ Medical Program has been called the largest medical relief program in Guatemala.",
        :"Sample of gift items" =>
        "Medical Supplies: 
        <ul class='disc'>
          <li>Medication</li>
          <li>Personal protective equipment</li>
          <li>Surgical equipment</li>
        </ul>
        Patient costs:
        <ul class='disc'>
          <li>A full surgery for one patient </li>
          <li>Post-surgical hospital stay for one patient</li>
        </ul>"
      }
    },

    # Provide access to clean water and cooking systems in rural Guatemala
    {
      name: "Provide access to clean water and cooking systems in rural Guatemala",
      partner: "HELPS International",
      description: "Installing clean stoves and water filtration systems to homes in rural Guatemala will help families avoid serious health problems, have a clean home they can be proud of, and provide access to a healthier lifestyle.",
      organization_id: Organization.find_by_name("HELPS International").id,
      funding_goal: 4000,
      city: "Guatemala",
      country: "Central America",
      url_slug: "helpsinternational-health-campaign",
      project_photo: "projects/helps-clean/project_photo.jpg",
      project_photo_2: "projects/helps-clean/project_photo_2.png",
      project_photo_3: "projects/helps-clean/project_photo_3.png",
      extra_content: {
        :"The Problem" => "Most people living in rural Guatemala do not have access to clean water sources or cooking methods. This contributes to a high rate of the population contracting stomach and respiratory illnesses. Often times these problems will go untreated due to a lack of funds to pay for doctor’s visits and medicine, which can sometimes lead to life-threatening conditions.",
        :"The Opportunity" => "In response to the high burden of these diseases on the Guatemalan population, HELPS developed the ONIL Stove and Gravity Water Filter. Proper use of this filter could prevent the onset of such health conditions before they begin.",
        :"How It Works" => "The ONIL stove is an inexpensive concrete stove that uses a galvanized steel venting pipe to replace open-flame fire pits. The Gravity Water Filter was designed by HELPS as a practical solution to meet the need for safe drinking water, using quality components at a very accessible price. <strong>The water filter provides 10 gallons of safe drinking water in 24 hours.</strong> It is simple to use and the initial setup time is about 15 minutes.The filtered water measures up to US standards of purification, and provides a safe backup system in times of emergency.
        <br />
        <br />
        After purchasing the stoves and filters, HELPS will:
        <ol>
          <li>Deliver the products to a community in rural Guatemala and demonstrate how they work.</li>
          <li>Install the stove and filter in each sponsored home.</li>
          <li>Train at least one family member on basic repairs and proper maintenance.</li>
          <li>Provide support or answer questions post-installation as needed.</li>
        </ol>",
        :"Why It's Important" =>
        "<ul class='disc'>
          <li><strong>Clean cooking:</strong> HELPS medical teams found an alarming number of people with burns and respiratory illnesses during their missions. This was caused by indigenous families cooking over open-flame fire pits on the dirt floors of their homes, with no ventilation for the toxic smoke and fumes. The ONIL stove reduces smoke and exposure to carbon monoxide by 99%, eliminates the risk of burns, and saves 70% in firewood consumption which results in a safer household environment.</li>
          <li><strong>Clean water:</strong>  60% of all disease is water borne and the lack of clean drinking water impacts all levels of society in the country. Most rural residents draw water from rivers, streams, ponds, or rainwater, which may be the only sources of water for some rural villages in Guatemala. HELPS’ Gravity Water Filter ensures 100% removal of parasites such as guinea worm and giardia, and 99.99% removal of pathogenic bacteria such as: cholera, e. coli, and shigella.</li>
        </ul>",
        :"Sustainability" => "HELPS has two factories in Guatemala where the stoves are being built locally. To date, 200,000 stoves and 91,000 water filters have been installed throughout Guatemala, Mexico and Central America.  These products and the installation program have the full support of the government and local communities for widespread scale-up. Their positive impact on health and the environment will help avoid serious health problems for all members of the family and preserve quality of life for years to come.",
        :"Sample Of Gift Items" => 
        "<ul class='disc'>
          <li>Onil Stove</li>
          <li>Gravity water filter</li>
          <li>Installation cost per household</li>
          <li>Training on maintenance and repair</li>
          <li>Spare parts to leave with families</li>
        </ul>"
      }
    },

    # Help Children with SCN8A Genetic Neurological Disorders
    {
      name: "Help Children with SCN8A Genetic Neurological Disorders",
      partner: "Wishes for Elliott",
      description: "Support scientific research and help find answers for the growing number of children around the world who suffer from rare genetic neurological disorders",
      organization_id: Organization.find_by_name("Wishes for Elliott").id,
      funding_goal: 3000,
      country: "Global",
      url_slug: "wishesforelliott-scn8a-mutation",
      project_photo: "projects/wishes-for-elliot/project_photo.jpg",
      project_photo_2: "projects/wishes-for-elliot/project_photo_2.jpg",
      project_photo_3: "projects/wishes-for-elliot/project_photo_3.jpg",
      extra_content: {
        :"The Problem" => "Imagine your child, grandchild, niece or nephew had a mysterious illness that neither you nor a team of brilliant neurologists could do anything about. Families of these children have all heard their doctors admit that they don’t have any answers and that there is little hope for improving their child’s condition. Children in 15 countries, so far, have been identified as having this disease but there are undoubtedly many more that will appear as genetic testing becomes more widely available. While the effect of this disorder on children varies widely, many children suffer as Elliott does with severely restricted movement (Elliott has never held his head up, grasped an object or been able to sit on his own) and cognitive development.
        <br />
        <br />
        <a href='http://www.wishesforelliott.org/' target='_blank'>Wishes for Elliott</a> was founded out of parents Gabi and John Conecker’s experience with a rare neurological disorder that affects their two year old son, Elliott, and their determination to try and find answers; answers that could build a better future for Elliott and many others like him.",
        :"The Opportunity" => "Even though learning these children have the SCN8A mutation, a seizure related disorder, has brought no immediate answers and no treatments for Elliott or other children, it has opened up an extraordinary opportunity to build a global database of all identified cases and lay the essential and promising groundwork for research. And research – grounded in real time data on emerging cases – offers a genuine opportunity to better understand and eventually develop treatments and cures for this debilitating disorder. On the foundation that Wishes for Elliott has already laid, recently gathering experts from around the world to set the agenda for future research efforts, your donation will push forward research that would otherwise not get done.",
        :"How It Works" => "With support from Heartful.ly donors, Wishes for Elliott can help to lay the groundwork for development of a bio-registry of identified cases. Specifically, this project would:
        <ol>
          <li>Support collection of natural history data (conditions, treatments, test results etc.) on identified cases.</li>
          <li> Gather test results and samples (e.g. MRIs) to further populate a comprehensive bio-registry of identified cases.</li>
          <li>Support expedited expert analyses of patients’ bio-registry entries for publication.</li>
          <li>Foster global collaborations to initiate research that can help identify possibly treatments for children suffering from SCN8A disorders.</li>
        </ol>",
        :"Why It's Important" => "There is an extraordinary absence of international coordination to tackle the many undiagnosed disorders killing children around the world. There are tens of thousands children living and struggling with rare and undiagnosed neurological disorders – but their cause remains largely ignored by major medical research efforts or the international donor agenda.",
        :"Sustainability" => "Developing a comprehensive global bio-registry on the SCN8A genetic disorder holds exciting promise to bring answers and hope to children struggling with that specific mutation, but will surely yield lessons and insights for other genetic and neurological conditions as well.
        <br />
        <br />
        Global collaboration is essential for addressing often hidden mysterious disorders robbing children of their lives. This was the main conclusion of a recent U.K.-based study that came \“to the sobering conclusion that even entire nations are too small to understand the genetics of neurodevelopmental disease.\".<a href='http://epilepsygenetics.net/2015/01/27/sequencing-for-developmental-disorders-on-a-national-level-the-ddduk-study/#more-3491' target='_blank'>*</a>",
        :"Sample of Gift Items:" => 
        "Support collection of natural history data (conditions, treatments, test results, etc.) on identified cases 
        <ul class='disc'>
          <li>Testing kits</li>
          <li>Laboratory equipment</li>
          <li>Researcher time</li>
        </ul>
        Gather test results and samples (e.g. MRIs) to further populate a comprehensive bio-registry  of identified cases database
        <ul class='disc'>
          <li>Transport for patients</li>
          <li>Cost of biopsy procedure</li>
          <li>MRI testing</li>
          <li>Laboratory and clinician time</li>
        </ul>",
        :"Info Box" =>
        "<iframe width='100%' height='315' src='https://www.youtube.com/embed/KT3ZF4x5CU4' frameborder='0' allowfullscreen></iframe>"
      }
    },

    # Build a safe place for children to play soccer in Brazil
    {
      name: "Build a safe place for children to play soccer in Brazil",
      partner: "Love.Futbol",
      description: "A safe place to play is often the last stand before gangs, drugs and despair.  Empower the community of Alianҫa, Brazil to provide its 5,000 children with a  place  to play soccer in the safe environment they deserve.",
      organization_id: Organization.find_by_name("Love.Futbol").id,
      funding_goal: 6000,
      city: "Brazil",
      country: " South America",
      url_slug: "lovefutbol-build-a-soccer-field",
      project_photo: "projects/love.futbol/project_photo.jpg",
      project_photo_2: "projects/love.futbol/photo_2.jpg",
      project_photo_3: "projects/love.futbol/photo_3.jpg",
      extra_content: {
        :"Background" => "love.fútbol engages, mobilizes and empowers underserved communities to build their own soccer fields. Alianҫa has 35,000 inhabitants, but the field site and the 9,000 locals living nearby are isolated from the rest of the city and lack safe community spaces.  This project will help to provide 5,000 children access to their first recreational field.",
        :"The Opportunity" => "love.fútbol provides raw materials, guidance, and serves as a catalyst to communities in need of a safe place to play through a proven methodology centered around personal and community empowerment.
        <br />
        <br />
        The community and its members donate land and labor, and plan and execute their own project – the success of the work is dependent on them.  As a result, love.fútbol projects are community-building experiences that achieve true local ownership – a critical tenant to sustainability.  A love.fútbol field is more than a place to play – it is a tangible and lasting symbol of civic strength and pride, proof of successful collaboration with an outside organization, and a platform for future change.
        <br />
        <br />
        Once funded, this soccer field will take approximately four to five months to build including mobilization, extensive planning meetings, multiple build days, and culminating with an inauguration celebration. The entire project costs approximately $60,000.",
        :"Why It's Important" =>
        "Across the globe, passionate youth are desperate and determined to play soccer.  They dribble barefoot in trash dumps, on narrow highway medians, and in busy streets between cars.  They retrieve balls from pure sewage, get chased off private land, and when the sun goes down, they walk long distances home in the dark through dangerous neighborhoods.
        <br />
        <br />
        Every single day youth are injured, assaulted, and worse in their fight to play the game they love.  The untold story is the loss of play and passion in their lives.  Shorter, less committed soccer life spans lead to far diminished returns on the productive and positive role that the game can have in their lives.
        <br />
        <br />
        The opportunity to be passionate, to be inspired, and to express oneself are fundamental human needs.  Love for the game equates to hope and belief in tomorrow.  A simple game and a place to play it are a tangible ways to effect change for those in need.",
        :"Sustainability" => "love.fútbol is more than an organization – it is a movement by the global soccer-passionate community to provide right to the game for all youth.  
        <br />
        <br />
        Fields are maintained through a comprehensive sustainability plan designed between love.fútbol and the community members who been a part of every aspect of the building process.  Their continued involvement is a natural progression based on the work, pride, and ownership they have in their field.
        <br />
        <br />
        love.fútbol’s projects have consistently shown social impact in the areas of education, health, and decreased anti-social behavior.
        Here’s what adults interviewed in four love.fútbol communities in Guatemala had to say:
        
        <ul class='disc'>
          <li>100% of the adults interviewed stated that the community was more united and strengthened</li>
          <li>83% of the parents and school directors reported a better school performance</li>
          <li>70% said there was an increase in the school attendance</li>
          <li>70% of the adults stated that the field has contributed to a decrease in drugs, alcohol abuse, and gang involvement</li>
          <li>98% of the children began exercising more after the project’s implementation.</li>
        </ul>",
        :"Sample Of Gift Items" =>
        "<ul class='disc'>
          <li>Goal posts</li>
          <li>Nets</li>
          <li>Lighting</li>
          <li>Cement</li>
        </ul>"
      }
    }
  ])

