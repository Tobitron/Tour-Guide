var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;

function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  var cambridge = new google.maps.LatLng(42.37786940559709, -71.10214233398438);
  var mapOptions = {
    zoom:12,
    center: cambridge
  };
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  directionsDisplay.setMap(map);
}

function calcRoute() {
  var start = new google.maps.LatLng(42.370260407036824, -71.11072540283203);
  var end = new google.maps.LatLng(42.35453222211428, -71.06266021728516);
  var request = {
      origin: start,
      destination: end,
      travelMode: google.maps.TravelMode.DRIVING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });
}

google.maps.event.addDomListener(window, 'load', initialize);


$( "#directions" ).click(function() {
  calcRoute();
});



// original map code ////////////

 // $.get("/tours/1.json", function(stops) {
// function initialize() {
//   var center = { lat: stops[0].latitude, lng: stops[0].longitude };
//   var mapOptions = {
//     center: center,
//     zoom: 14
//   };
//
//   var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
//
//
//   stops.forEach(function(stop) {
//     var marker = new google.maps.Marker({
//         position: new google.maps.LatLng(stop.latitude, stop.longitude),
//         map: map
//     });
//
//     google.maps.event.addDomListener(document.getElementById(stop.name), 'click', function () {
//       map.setCenter(new google.maps.LatLng(stop.latitude, stop.longitude));
//     });
//
//     var infowindow = new google.maps.InfoWindow({
//       content: '<div>' + stop.description + '</div>'
//     });
//
//
//     google.maps.event.addListener(marker, 'click', function() {
//       map.setCenter(marker.getPosition());
//       infowindow.open(map, marker);
//     });
//   });
//  }
//
// google.maps.event.addDomListener(window, 'load', initialize);

 // });
