function Map() {};

Map.prototype = {
  initialize: function(){
    var mapOptions = {
      zoom: 5,
      center: new google.maps.LatLng(34.0000, -98.5795)
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

    var contentTemplate = ""

    var infowindow = new google.maps.InfoWindow({
      content: "Boom!"
    })

    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(34.0000, -98.5795),
      map: map,
      title: 'Uluru (Ayers Rock)',
    });
    google.maps.event.addListener(marker, 'click', function() {
      infowindow.open(map,marker);
    });
  },
  showMap: function(e) {
    e.preventDefault()
    $('#map-canvas').show(500)
    // google.maps.event.trigger(map, 'resize');
    // map.setZoom( map.getZoom() );
  }
}
