function Map() {};

Map.prototype = {
  initialize: function(markers){
    var mapOptions = {
      zoom: 4
      ,
      center: new google.maps.LatLng(34.0000, -98.5795)
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

    var contentTemplate = "<h1>{{city}}</h1><p>{{bootTotal}} boots are in {{city}}</p> <a href='#'>Show boots</a>"

    var infowindow = new google.maps.InfoWindow({
      content: "Bangarang, Peter!"
    })

     //new google.maps.Marker({
    //   position: new google.maps.LatLng(34.0000, -98.5795),
    //   map:map,
    // });
    // google.maps.event.addListener(marker, 'click', function() {
    //   infowindow.open(map,marker);
    // });
    this.setMarkers(map,markers)
  },
  setMarkers: function (map, locations) {
      for (var i = 0; i < locations.length; i++) {
      var beach = locations[i];
      var myLatLng = new google.maps.LatLng(beach[1], beach[2]);
      var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          title: beach[0],
          zIndex: beach[3]
      });
     }
    },
  showMap: function(e) {
    e.preventDefault()
    $('#map-canvas').show()
    $(".card-container").html("")
    var markers = [["Bunny beach", 34.0000, -99.5795, 1],
                  ["Heel beach", 33.0000, -98.5795, 2],
                  ["Stallion beach", 35.0000, -98.5795, 3]]
    map.initialize(markers)
  }
}
