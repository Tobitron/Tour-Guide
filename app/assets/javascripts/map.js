// $.get("/tours/1.json", function(stops) {
function initialize() {
  var center = { lat: stops[0].latitude, lng: stops[0].longitude };
  var mapOptions = {
    center: center,
    zoom: 14
  };

  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);


  stops.forEach(function(stop) {
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(stop.latitude, stop.longitude),
        map: map
    });

    var infowindow = new google.maps.InfoWindow({
      content: '<div>' + stop.description + '</div>'
    });

    google.maps.event.addDomListener(document.getElementById(stop.name), 'click', function () {
      map.setCenter(new google.maps.LatLng(stop.latitude, stop.longitude));
    });

    google.maps.event.addListener(marker, 'click', function() {
      map.setCenter(marker.getPosition());
      infowindow.open(map, marker);
    });
  });
 }

google.maps.event.addDomListener(window, 'load', initialize);


// });
