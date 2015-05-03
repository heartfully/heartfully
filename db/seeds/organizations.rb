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
