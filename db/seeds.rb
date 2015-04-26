users = User.create([
  { email: "tobias@kahn.com", password: "password" }
  ])

tours = Tour.create([
  { name: "San Francisco Burritos", user_id: 1, category: "Food/Drinks" },
  { name: "Boston North End", user_id: 1, category: "Site Seeing" },
  { name: "Cambridge Bars", user_id: 1, category: "Food/Drinks" },
  { name: "New York City Art Deco", user_id: 1, category: "Architecture" },
  { name: "Boston Brahmin", user_id: 1, category: "Architecture" },
  { name: "Harvard Square Haunts", user_id: 1, category: "Architecture" },
  { name: "Pacific Rim Modern of Seattle", user_id: 1, category: "Architecture" }
  ])

stops = Stop.create([
  { name: "Taqueria Cancun", description: "My absolute favorite burrito in the world. Chunks of perfectly ripe avocado, rice cooked to aromatic perfection in tomato and spices, succulent carne asada, all inside a grilled tortilla. If only burrito spots outside of California realized that grilling your tortilla makes a huge difference!", latitude: 37.760457, longitude: -122.419576, stop_length: 30 },
  { name: "Papalote Mexican Grill" , description: "Though disregarded by many as no true Mission burrito, I think it's wonderful. Papalote is known for their high quality ingredients and fabulous salsa. Their sauces in general are a cut above the surrounding taquerias, especially their mole", latitude: 37.751940, longitude: -122.420992, stop_length: 45},
  { name: "La Taqueria", description: "Known for its tacos and carnita burritos, somehow won Fivethirtyeight's burrito showdown. I'd recommend their tacos over their burritos anyday. But hey to each their own, maybe the critics saw something I didn't.", latitude: 37.750880, longitude: -122.418122, stop_length: 45 },
  { name: "El Farolito", description: "You'd be hard pressed to find a San Franciscan without a soft spot for El Farolito. Their signature carne asada burrito is MASSIVE. It's seriously huge, and cheap. It's also extremely solid, much in the same style as Cancun, though I find it lacks some oomph in comparison. Hard to describe why. Anyway, the fact that it's open until 4am is probably what makes El Farolito so special to the city's denizens.", latitude: 37.752839, longitude: -122.411123, stop_length: 45 },
  { name: "Green Chile Kitchen", description: "Obviously nowhere outside of the Mission has good burritos but I wanted to show how cool my map centering is :)", latitude: 37.777308, longitude: -122.441849, stop_length: 45 },
  { name: "Ernesto’s", description: "Forget all of the tourist traps with long lines. For people seeking good, authentic North End pizza without the hassle, look no further than Ernesto’s on Salem Street. For those starting their walking tour at the Rose Kennedy Greenway, simply walk down Salem Street for less than a block and Ernesto’s will be on the right. Try a slice with ricotta cheese, or one of the specialties like the ever-popular chicken bacon ranch.", latitude: 42.363387, longitude: -71.055877, stop_length: 45 },
  { name: "Paul Revere House", description: "Paul Revere is known for his midnight ride from Boston to Lexington, warning all the people along the way that the British were coming. He owned the home for over three decades and is Boston’s oldest building, dating back to the late 1600s. Admission for a tour of the house is $3 for adults and $1 for children. Tours are available seven days a week until 5 p.m. Located at 19 North Square", latitude: 42.363724, longitude: -71.053677, stop_length: 45 },
  { name: "Bova's Bakery", description: "While most visitors head to Mike's pastries, this tour points you to the local favorite: Bova's. This Italian bakery has all the usual suspects like tiramisu and cannolis, but try their bread!", latitude: 42.365196, longitude: -71.055596, stop_length: 15 },
  { name: "Old North Church", description: "Getting to the Old North Church via Salem Street provides a new perspective of this historic landmark. On the Hanover Street side, which is the typical path for people visiting the North End, visitors are greeted with the towering Paul Revere statue, street performers and, of course, hoards of people. The Salem side offers a different feel. Passersby could almost miss the church if they’re not paying attention because it looks so quaint and natural from this side. This gives people a better feel of how it would have been a hundred years ago.", latitude: 42.366270, longitude: -71.054638, stop_length: 15 },
  { name: "Harbor Walk", description: "Finish off the tour with a stroll through the lovely Harbor Walk, a trail that winds along parts of Boston Harbor and connects the historic wharves of the Boston waterfront.", latitude: 42.366863, longitude: -71.050933, stop_length: 45 },
  { name: "River Gods", description: "Though out of the way, River Gods is one of Cambridge's funkiest and hippest bars. With a cool dive bar meets art school vibe, River Gods also has kick ass DJs.", latitude: 42.364044, longitude: -71.108693, stop_length: 90 },
  { name: "Brick and Mortar", description: "Fans leave tipsy and happy from this classy Central Square bar set in an unmarked space, where mixology magicians with Wikipedia-like spirits knowledge whip up fancy cocktails with witty names; tasty snacks, a hip mood and a gorgeous zinc bartop make the pricey tabs easier to swallow.", latitude: 42.364916, longitude: -71.102320, stop_length: 90 },
  { name: "Lord Hobo", description: "Lord Hobo is one of the best beer bars in the city, but perhaps not the most hip. If there's a new, rare, or hard-to-find beer, Lord Hobo probably has it among more than 40 draft lines or its extensive bottle selection. It's not snobbish though: bartenders are always quick with a recommendation and a sample. The crowd is young, and while it can get packed, you can usually snag a bar seat or a high top. The red walls and dim lights make it feel a bit like a dungeon – but one you're OK spending all day (and night) in.", latitude: 42.368782, longitude: -71.095052, stop_length: 90 },
  { name: "Daedalus", description: "A bar and restaurant just off of Harvard Square, the often bustling Daedalus is an all around charmer, but particularly great in the warmer months when patrons can lounge in their cozy rooftop deck!", latitude: 42.371262, longitude: -71.116268, stop_length: 90 },
  { name: "The Sinclair", description: "In addition to being one of Boston's best venues, featuring a variety of hot indie acts, the Sinclair is an excellent restaurant and bar. Hip and classy without being stuffy, The Sinclair is a great spot to grab a cocktail.", latitude: 42.374099, longitude: -71.120773, stop_length: 90 }
  ])


tour_stops = TourStop.create([
  # Start SF burrito tour
  { tour_id: 1, stop_id: 1, stop_number: 1},
  { tour_id: 1, stop_id: 2, stop_number: 2},
  { tour_id: 1, stop_id: 3, stop_number: 3},
  { tour_id: 1, stop_id: 4, stop_number: 4},
  { tour_id: 1, stop_id: 5, stop_number: 5},
  # Start North End Tour
  { tour_id: 2, stop_id: 6, stop_number: 1},
  { tour_id: 2, stop_id: 7, stop_number: 2},
  { tour_id: 2, stop_id: 8, stop_number: 3},
  { tour_id: 2, stop_id: 9, stop_number: 4},
  { tour_id: 2, stop_id: 10, stop_number: 5},
  # Start Cambridge bar tour
  { tour_id: 3, stop_id: 11, stop_number: 1},
  { tour_id: 3, stop_id: 12, stop_number: 2},
  { tour_id: 3, stop_id: 13, stop_number: 3},
  { tour_id: 3, stop_id: 14, stop_number: 4},
  { tour_id: 3, stop_id: 15, stop_number: 5}
  ])
