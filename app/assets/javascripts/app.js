$(document).ready(function(){
  search = new Search()
  search.start();
  // var mapOptions = {
  //   center: new google.maps.LatLng(-34.397, 150.644),
  //   zoom: 8
  // };
  // var map = new google.maps.Map(document.getElementById("map-canvas"),
  //   mapOptions);

var map;
function initialize() {
  var mapOptions = {
    zoom: 5,
    center: new google.maps.LatLng(34.0000, -98.5795)
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
    mapOptions);
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(34.0000, -98.5795),
    map: map,
    title:"Hello World!"
  });
}

google.maps.event.addDomListener(window, 'load', initialize);

})