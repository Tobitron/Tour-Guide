// var x = location.href
// var x = x + '.json'
// var y = x.replace("stops/1/edit", "")
//
// $.get(x, function(duration) {
//   // var origin1 = new google.maps.LatLng(duration.stops[0].longitude, duration.stops[0].latitude);
//   // var origin2 = new google.maps.LatLng(duration.stops[1].longitude, duration.stops[1].latitude);
//   // var destination1 = new google.maps.LatLng(duration.stops[1].longitude, duration.stops[1].latitude);
//   // var destination2 = new google.maps.LatLng(duration.stops[2].longitude, duration.stops[2].latitude);
//   // var origin1 = new google.maps.LatLng(55.930, -3.118);
//   // var origin2 = 'Greenwich, England';
//   // var destinationA = 'Stockholm, Sweden';
//   // var destinationB = new google.maps.LatLng(42.35177601519706, -71.06135129928589);
//   var launch = new google.maps.LatLng(55.930, -3.118);
//   var copley = new google.maps.LatLng(42.349698621511365, -71.08358144760132);
//   var cambridgeport = new google.maps.LatLng(42.356538101817605, -71.10969543457031);
//   var harvard_squre = new google.maps.LatLng(42.37251942469954, -71.11759185791016);
//
//   function calculateDistances() {
//   debugger;
//     var service = new google.maps.DistanceMatrixService();
//     service.getDistanceMatrix(
//       {
//         origins: [launch, copley],
//         destinations: [copley, cambridgeport],
//         travelMode: google.maps.TravelMode.WALKING,
//         unitSystem: google.maps.UnitSystem.IMPERIAL
//       }, callback);
//   }
//
//   function callback(response, status) {
//     if (status != google.maps.DistanceMatrixStatus.OK) {
//       alert('Error was: ' + status);
//     } else {
//       debugger;
//         $.ajax({
//           url: '/tours/1.json',
//           data: { tour_length: response },
//           dataType: 'json',
//           method: 'PATCH'
//         }).success(function(data) {
//           alert('it updated it!');
//         });
//     }
//   };
//
//   $("#new_stop").on('click', function(e) {
//     calculateDistances();
//   });
//
// });
