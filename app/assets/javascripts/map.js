function Map() {};

Map.prototype = {
  initialize: function(markers){
    var mapOptions = {
      zoom: 4
      ,
      center: new google.maps.LatLng(34.0000, -98.5795)
    };
    mapo = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

    var contentTemplate = "<h1>{{city}}</h1><p>{{bootTotal}} boots are in {{city}}</p> <a href='#'>Show boots</a>"

    var infowindow = new google.maps.InfoWindow({
      content: "Bangarang, Peter!"
    })

    //this.setMarkers(map,markers)
  },
  // setMarkers: function (map, locations) {
  //     for (var i = 0; i < locations.length; i++) {
  //     var marker = locations[i];
  //     var myLatLng = new google.maps.LatLng(marker[1], marker[2]);
  //     var marker = new google.maps.Marker({
  //         position: myLatLng,
  //         map: mapo,
  //         title: marker[0]
  //     });
  //    }
  //   },
  showMap: function(response) {
    map.initialize()
    locations = response.locations
    geo = new google.maps.Geocoder();
    for(var i = 1; i<locations.length; i++){
     map.getPins(i)
    }
    $('#map-canvas').show()
    $(".card-container").html("")
  },
  getPins: function(i){
    geo.geocode({address: locations[i].location},function(response,status){
      if (status === "OK"){
        var marker = new google.maps.Marker({
        position: response[0].geometry.location,
        title:response[0].formatted_address,
        animation: google.maps.Animation.DROP,
        map: mapo});
      }
      else{
        console.log(status)
      }
    })
  }
}