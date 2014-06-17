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
      var marker = locations[i];
      var myLatLng = new google.maps.LatLng(marker[1], marker[2]);
      var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          title: marker[0],
          zIndex: marker[3]
      });
     }
    },
  showMap: function(response) {
    var locations = response.locations
    var markers =[]
    var geo = new google.maps.Geocoder();
    for(var i = 1; i<locations.length; i++ ){
      var loc = [locations[i].location]
      geo.geocode({address: loc[0]},function(res,sta){
        debugger
        loc.push(res[0].geometry.location.k)
        loc.push(res[0].geometry.location.a)
        })
    markers.push(loc)
    }
    console.log(markers)
    $('#map-canvas').show()
    $(".card-container").html("")
    map.initialize(markers)
  }
}
