function initialize() {
  var myLatlng = new google.maps.LatLng(-25.363882,131.044922);
  var mapOptions = {
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 8
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"),
    mapOptions);

  var mapOptions = {
    zoom: 4,
    center: myLatlng
  }

  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

// To add the marker to the map, use the 'map' property
  var marker = new google.maps.Marker({
    position: myLatlng,
    map: map,
    title:"Hello World!",
    draggable: false
  });
marker.setMap(map);
}

google.maps.event.addDomListener($('.mapContainer'), 'load', initialize);
