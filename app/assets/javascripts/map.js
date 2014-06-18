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

  },

  showMap: function(response) {
    map.initialize()
    locations = response.locations
    for(var i = 1; i<locations.length; i++){
     map.getPins(i)
    }
    $('#map-canvas').show()
    $(".card-container").html("")
  },
  getPins: function(i){
    //debugger
        var myLatlng = new google.maps.LatLng(locations[i].latitude,locations[i].longitude)
        var marker = new google.maps.Marker({
        position: myLatlng,
        title:locations[i].location,
        animation: google.maps.Animation.DROP,
        map: mapo});
      }
  }
