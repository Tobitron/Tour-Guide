var origin1 = new google.maps.LatLng(55.930, -3.118);
var origin2 = new google.maps.LatLng(57.930, -3.418);
var destinationA = new google.maps.LatLng(52.930, -3.118);
var destinationB = new google.maps.LatLng(50.087, 14.421);


function calculateDistances() {
  var service = new google.maps.DistanceMatrixService();
  service.getDistanceMatrix(
    {
      origins: [origin1, origin2],
      destinations: [destinationA, destinationB],
      travelMode: google.maps.TravelMode.DRIVING,
      unitSystem: google.maps.UnitSystem.METRIC,
      avoidHighways: false,
      avoidTolls: false
    }, callback);
}

function callback(response, status) {
  if (status != google.maps.DistanceMatrixStatus.OK) {
    alert('Error was: ' + status);
  } else {

    // Is there a way to send this JSON result back to Ruby?
    // could do the logic to figure out the amount of time here in the Javascript too
    // note the duration "value" is calculated in seconds

    }
  }

calculateDistances()
