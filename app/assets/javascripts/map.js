function Map() {};

Map.prototype = {
  initialize: function(){
    var mapOptions = {
      zoom: 5,
      center: new google.maps.LatLng(34.0000, -98.5795)
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

    var contentTemplate = "<h1>{{city}}</h1><p>{{bootTotal}} boots are in {{city}}</p> <a href='#'>Show boots</a>"

    var infowindow = new google.maps.InfoWindow({
      content: "Bangarang, Peter!"
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
    $('#map-canvas').show()
    $(".card-container").html("")
    map.initialize()
  }
}
