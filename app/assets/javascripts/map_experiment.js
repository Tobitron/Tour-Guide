// var x = location.href
// var x = x + '.json'
//
// $.get(x, function(map_json) {
//   function get_location(location) {
//     navigator.geolocation.getCurrentPosition(show_map);
//   };
//
//   function show_map(loc) {
//     window.user_latitude = loc.coords.latitude;
//     window.user_longitude = loc.coords.longitude
//   };
//
//   get_location(location);
//
//   var directionsDisplay;
//   var directionsService = new google.maps.DirectionsService();
//
//   function initialize() {
//     // supressed directions marker icons here, could theoritcally make custom ones, but I think it'll be busy in addition to place markers
//     directionsDisplay = new google.maps.DirectionsRenderer({suppressMarkers: true});
//
//     // var center = { lat: map_json.tours[0].latitude, lng: map_json.tours[0].longitude };
//     debugger;
//
//     var mapOptions = {
//       center: center,
//       zoom: 14
//     };
//
//     var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
//
//     directionsDisplay.setMap(map);
//     directionsDisplay.setPanel(document.getElementById('directions-text'));
//
//     map_json.tours.forEach(function(stop) {
//       var marker = new google.maps.Marker({
//           position: new google.maps.LatLng(stop.latitude, stop.longitude),
//           map: map
//       });
//
//       google.maps.event.addDomListener(document.getElementById(stop.div_id), 'click', function () {
//         map.setCenter(new google.maps.LatLng(stop.latitude, stop.longitude));
//         // This will reset the directions panel if you click on another stop, not sure if I want to do this though
//         // document.getElementById("directions-text").innerHTML = "";
//       });
//
//       google.maps.event.addListener(marker, 'click', function() {
//         map.setCenter(marker.getPosition());
//         infowindow.open(map, marker);
//       });
//     });
//   }
//
//   function calc_route_to_start() {
//     var start = new google.maps.LatLng(user_latitude, user_longitude);
//     var end = new google.maps.LatLng(map_json.tours[0].latitude, map_json.tours[0].longitude);
//
//     var request = {
//         origin: start,
//         destination: end,
//         travelMode: google.maps.TravelMode.WALKING
//     };
//
//     directionsService.route(request, function(response, status) {
//       if (status == google.maps.DirectionsStatus.OK) {
//         directionsDisplay.setDirections(response);
//       }
//     });
//   };
//
//   function calc_route(start_lat, start_long, end_lat, end_long) {
//    var start = new google.maps.LatLng(start_lat, start_long);
//    var end = new google.maps.LatLng(end_lat, end_long);
//
//    var request = {
//        origin: start,
//        destination: end,
//        travelMode: google.maps.TravelMode.WALKING
//    };
//
//    directionsService.route(request, function(response, status) {
//      if (status == google.maps.DirectionsStatus.OK) {
//        directionsDisplay.setDirections(response);
//      }
//    });
//   };
//
//   google.maps.event.addDomListener(window, 'load', initialize);
//
//   $("#" + map_json.tours[0].div_id + '_directions').click(function() {
//     calc_route_to_start();
//   });
//
//   // This loop both declares which divs should trigger calcRoute, and passes in the parameters that calcRoute will use
//   map_json.tours.forEach(function(stop) {
//     $("#" + stop.div_id + "_directions").click(function() {
//       calc_route(stop.latitude, stop.longitude, maps[(stop.stop_number)].latitude, tour_data[(stop.stop_number)].longitude);
//     });
//   });
//
// });
