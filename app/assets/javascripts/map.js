var directionsDisplay;
var directionsService = new google.maps.DirectionsService();

function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  var center = { lat: stops[0].latitude, lng: stops[0].longitude };
  var mapOptions = {
    center: center,
    zoom: 14
  };

  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('directions-text'));

  stops.forEach(function(stop) {

    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(stop.latitude, stop.longitude),
        map: map
    });

    // Note to future Toby! When I changed the naming mechanism for Ids in ruby it probably fucked this up.
    // google.maps.event.addDomListener(document.getElementById(stop.name), 'click', function () {
    //   map.setCenter(new google.maps.LatLng(stop.latitude, stop.longitude));
    // });

    var infowindow = new google.maps.InfoWindow({
      content: '<div>' + stop.description + '</div>'
    });

    google.maps.event.addListener(marker, 'click', function() {
      map.setCenter(marker.getPosition());
      infowindow.open(map, marker);
    });
  });
 }

function calcRoute() {
  // I want start to be stop number of div id clicked on + 1
  // trying to create an API to serve up JSON data yayyySON

 var start = new google.maps.LatLng(stops[0].latitude, stops[0].longitude);
 var end = new google.maps.LatLng(stops[1].latitude, stops[1].longitude);

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


// instead of hardcoding ids, will need to loop through stop ids and insert their names
$("#river_gods, #brick_and_mortar, #the_plough_and_stars").click(function() {
  calcRoute();
});
