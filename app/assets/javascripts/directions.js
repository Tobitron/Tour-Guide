// var directionsDisplay;
// var directionsService = new google.maps.DirectionsService();
// var map;
//
// function initialize() {
//   directionsDisplay = new google.maps.DirectionsRenderer();
//   var chicago = new google.maps.LatLng(41.850033, -87.6500523);
//   var mapOptions = {
//     zoom: 6,
//     center: chicago
//   }
//   map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
//   directionsDisplay.setMap(map);
// }
//
// function calcRoute() {
//   var start = document.getElementById('start').value;
//   var end = document.getElementById('end').value;
//   var waypts = [];
//   var checkboxArray = document.getElementById('waypoints');
//   for (var i = 0; i < checkboxArray.length; i++) {
//     if (checkboxArray.options[i].selected == true) {
//       waypts.push({
//           location:checkboxArray[i].value,
//           stopover:true});
//     }
//   }
//
//   var request = {
//       origin: start,
//       destination: end,
//       waypoints: waypts,
//       optimizeWaypoints: true,
//       travelMode: google.maps.TravelMode.DRIVING
//   };
//   directionsService.route(request, function(response, status) {
//     if (status == google.maps.DirectionsStatus.OK) {
//       directionsDisplay.setDirections(response);
//       var route = response.routes[0];
//       var summaryPanel = document.getElementById('directions_panel');
//       summaryPanel.innerHTML = '';
//       // For each route, display summary information.
//       for (var i = 0; i < route.legs.length; i++) {
//         var routeSegment = i + 1;
//         summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment + '</b><br>';
//         summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
//         summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
//         summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
//       }
//     }
//   });
// }
//
//
//
// var directionsDisplay;
// var directionsService = new google.maps.DirectionsService();
//
//
// function initialize() {
//   directionsDisplay = new google.maps.DirectionsRenderer();
//   var cambridge = new google.maps.LatLng(42.37786940559709, -71.10214233398438);
//   var mapOptions = {
//     zoom:12,
//     center: cambridge
//   };
//   map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
//   directionsDisplay.setMap(map);
// }
//
// function calcRoute() {
//   var start = new google.maps.LatLng(42.370260407036824, -71.11072540283203);
//   var end = new google.maps.LatLng(42.35453222211428, -71.06266021728516);
//   var request = {
//       origin: start,
//       destination: end,
//       travelMode: google.maps.TravelMode.DRIVING
//   };
//   directionsService.route(request, function(response, status) {
//     if (status == google.maps.DirectionsStatus.OK) {
//       directionsDisplay.setDirections(response);
//     }
//   });
// }
//
// google.maps.event.addDomListener(window, 'load', initialize);
//
//
// $( "#directions" ).click(function() {
//   calcRoute();
// });
