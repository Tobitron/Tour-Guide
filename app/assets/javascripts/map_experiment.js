var current_url = location.href
var current_url = current_url + '.json'

  // Need to add conditions for failure
  function get_location(location) {
    navigator.geolocation.getCurrentPosition(show_map);
  };

  function show_map(loc) {
    window.user_latitude = loc.coords.latitude;
    window.user_longitude = loc.coords.longitude

    $.ajax({
      method: 'PUT',
      url: '/',
      data: { user_latitude: user_latitude,  user_longitude: user_longitude },
      dataType: 'json'
    });
  };

  get_location(location);

  var directionsDisplay;
  var directionsService = new google.maps.DirectionsService();

function initialize() {
  $.get(current_url, function(json_tour_data) {
  directionsDisplay = new google.maps.DirectionsRenderer({suppressMarkers: true});
    var center = { lat: json_tour_data["tour"].tour_stops[0].stop.latitude, lng: json_tour_data["tour"].tour_stops[0].stop.longitude + .015 };
    var mapOptions = {
      center: center,
      zoom: 14
    };

    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    directionsDisplay.setMap(map);

    json_tour_data["tour"]["tour_stops"].forEach(function(stop) {
      var marker = new google.maps.Marker({
          position: new google.maps.LatLng(stop["stop"].latitude, stop["stop"].longitude),
          map: map,
          icon: {
              path: google.maps.SymbolPath.CIRCLE,
              scale: 14,
              fillColor: "#E26008",
              fillOpacity: 0.6,
              strokeWeight: 0.6
          },
      });

      google.maps.event.addDomListener(document.getElementById(stop.stop.div_id), 'click', function () {
        map.setCenter(new google.maps.LatLng(stop["stop"].latitude, stop["stop"].longitude + .01));

        json_tour_data["tour"]["tour_stops"].forEach(function(stop) {
          document.getElementById(stop.stop.div_id + "_directions_text").innerHTML = "";
        });
      });

      google.maps.event.addListener(marker, 'click', function() {
        map.setCenter(marker.getPosition());
      });
    });
  });
};

google.maps.event.addDomListener(window, 'load', initialize);



  // function calc_route_to_start() {
  //   var start = new google.maps.LatLng(user_latitude, user_longitude);
  //   var end = new google.maps.LatLng(json_tour_data["tour"]["tour_stops"][0]["stop"].latitude, json_tour_data["tour"]["tour_stops"][0]["stop"].longitude);
  //
  //   var request = {
  //       origin: start,
  //       destination: end,
  //       travelMode: google.maps.TravelMode.WALKING
  //   };
  //
  //   directionsService.route(request, function(response, status) {
  //     if (status == google.maps.DirectionsStatus.OK) {
  //       directionsDisplay.setDirections(response);
  //     }
  //   });
  // };
  //
  // function calc_total_route() {
  //   var x = json_tour_data["tour"]["tour_stops"].length - 1
  //   var start = new google.maps.LatLng(json_tour_data["tour"]["tour_stops"][0]["stop"].latitude, json_tour_data["tour"]["tour_stops"][0]["stop"].longitude);
  //   var end = new google.maps.LatLng(json_tour_data["tour"]["tour_stops"][x]["stop"].latitude, json_tour_data["tour"]["tour_stops"][x]["stop"].longitude);
  //   var waypts = [];
  //
  //   // loop over all destinations except start and end. For each push the destination into a new point
  //   json_tour_data["tour"]["tour_stops"].forEach(function(stop) {
  //     waypts.push({
  //             location:new google.maps.LatLng(stop["stop"].latitude, stop["stop"].longitude),
  //             stopover:true});
  //   });
  //
  //   var request = {
  //       origin: start,
  //       waypoints: waypts,
  //       destination: end,
  //       optimizeWaypoints: true,
  //       travelMode: google.maps.TravelMode.WALKING
  //   };
  //
  //   directionsService.route(request, function(response, status) {
  //     if (status == google.maps.DirectionsStatus.OK) {
  //       leg_durations = []
  //       leg_lengths = []
  //
  //       // I need to loop through the response and create an array of durations
  //       response.routes[0].legs.forEach(function(duration) {
  //           leg_durations.push(duration.duration);
  //       });
  //
  //       response.routes[0].legs.forEach(function(length) {
  //           leg_lengths.push(length.distance);
  //       });
  //
  //       $.ajax({
  //         method: 'PUT',
  //         url: x,
  //         data: { tour_legs: leg_durations, leg_lengths: leg_lengths },
  //         dataType: 'json'
  //       });
  //     }
  //   });
  // };
  //
  // calc_total_route();
  //
  function calc_route(stop_div_id, start_lat, start_long, end_lat, end_long) {
   var start = new google.maps.LatLng(start_lat, start_long);
   var end = new google.maps.LatLng(end_lat, end_long);

   var request = {
       origin: start,
       destination: end,
       travelMode: google.maps.TravelMode.WALKING
   };

   directionsService.route(request, function(response, status) {
     if (status == google.maps.DirectionsStatus.OK) {
       directionsDisplay.setDirections(response);
     }
   });

   directionsDisplay.setPanel(document.getElementById(stop_div_id + '_directions_text'));
  };
  //
  //
  // $("#" + json_tour_data.tour.tour_stops[0].stop.div_id + '_directions').click(function() {
  //   calc_route_to_start();
  // });


  // This loop both declares which divs should trigger calcRoute, and passes in the parameters that calcRoute will use
$.get(current_url, function(json_tour_data) {
  json_tour_data.tour.tour_stops.forEach(function(stop) {
    $("#" + stop.stop.div_id + "_directions").click(function() {
      calc_route(stop.stop.div_id, stop["stop"].latitude, stop["stop"].longitude, json_tour_data.tour.tour_stops[stop.stop_number].stop.latitude, json_tour_data.tour.tour_stops[stop.stop_number].stop.longitude);
    });
  });
});
