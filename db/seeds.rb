# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


tours = Tour.create([
  { name: "San Francisco Burrito Tour" },
  { name: "Cambridge Bar Tour" }
  ])

stops = Stop.create([
  { name: "Taqueria Cancun", description: "Objectively the best burrito in the universe. A pound of glory GLORY.", latitude: 37.760457, longitude: -122.419576, stop_length: 30 },
  { name: "Papalote Mexican Grill" , description: "Though disregarded as healthy gringo burritos, Papalote is known for their high quality ingredients and fabulous salsa.", latitude: 37.751940, longitude: -122.420992, stop_length: 45},
  { name: "La Taqueria", description: "Known for its tacos and carnita burritos, somehow won Fivethirtyeight's burrito showdown.", latitude: 37.750880, longitude: -122.418122, stop_length: 45 },
  { name: "Green Chile Kitchen", description: "Obviously nowhere outside of the Mission has good burritos but I wanted to show how cool my map centering is.", latitude: 37.777308, longitude: -122.441849, stop_length: 45 },
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
