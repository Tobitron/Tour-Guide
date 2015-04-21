users = User.create([
  { email: "tobias@kahn.com", password: "password" }
  ])

tours = Tour.create([
  { name: "San Francisco Burrito Tour", user_id: 1, category: "Food/Drinks" },
  { name: "Cambridge Bar Tour", user_id: 1, category: "Food/Drinks" }
  ])

stops = Stop.create([
  { name: "Taqueria Cancun", description: "Objectively the best burrito in the universe. A pound of glory GLORY.", latitude: 37.760457, longitude: -122.419576, stop_length: 30 },
  { name: "Papalote Mexican Grill" , description: "Though disregarded as healthy gringo burritos, Papalote is known for their high quality ingredients and fabulous salsa.", latitude: 37.751940, longitude: -122.420992, stop_length: 45},
  { name: "La Taqueria", description: "Known for its tacos and carnita burritos, somehow won Fivethirtyeight's burrito showdown. Fingerstache Thundercats Banksy wolf fixie, viral post-ironic High Life. Ugh letterpress Thundercats Kickstarter. Sustainable locavore listicle, selfies meditation Etsy plaid whatever wolf meggings meh. Thundercats roof party Etsy cardigan. Brunch salvia flannel, health goth messenger bag cardigan leggings keytar actually. Normcore meh artisan mustache cronut, readymade single-origin coffee wayfarers messenger bag VHS. Lo-fi raw denim health goth, Vice next level post-ironic PBR&B mumblecore keytar plaid Marfa fanny pack.", latitude: 37.750880, longitude: -122.418122, stop_length: 45 },
  { name: "Green Chile Kitchen", description: "Obviously nowhere outside of the Mission has good burritos but I wanted to show how cool my map centering is. Shabby chic disrupt four dollar toast, chillwave small batch keytar biodiesel. Forage slow-carb sustainable tofu lo-fi, deep v tousled salvia gastropub try-hard seitan chillwave readymade Vice aesthetic. Gastropub meggings lomo Echo Park, flexitarian actually butcher. Butcher food truck pork belly McSweeney's tote bag, viral meditation synth Neutra selfies roof party polaroid American Apparel. Thundercats Brooklyn artisan, kale chips cred hoodie PBR&B pork belly kitsch cardigan mumblecore leggings bespoke. Yr sartorial 90's Austin butcher. Austin artisan salvia Intelligentsia.", latitude: 37.777308, longitude: -122.441849, stop_length: 45 },
  { name: "River Gods", description: "Though out of the way, River Gods is one of Cambridge's funkiest and hippest bars.", latitude: 42.364044, longitude: -71.108693, stop_length: 90 },
  { name: "Brick and Mortar", description: "A classy bar located in Central square.", latitude: 42.364916, longitude: -71.102320, stop_length: 90 }
  ])


tour_stops = TourStop.create([
  { tour_id: 1, stop_id: 1, stop_number: 1},
  { tour_id: 1, stop_id: 2, stop_number: 2},
  { tour_id: 1, stop_id: 3, stop_number: 3},
  { tour_id: 1, stop_id: 4, stop_number: 4},
  { tour_id: 2, stop_id: 5, stop_number: 1},
  { tour_id: 2, stop_id: 6, stop_number: 2}
  ])
