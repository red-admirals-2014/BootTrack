function Map() {};

Map.prototype = {
  initialize: function(markers){
    var mapOptions = {
      zoom: 4
      ,
      center: new google.maps.LatLng(34.0000, -98.5795)
    };
    bootMap = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);


    var infowindow = new google.maps.InfoWindow()

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
        var myLatlng = new google.maps.LatLng(locations[i].latitude,locations[i].longitude)
        var marker = new google.maps.Marker({
        position: myLatlng,
        title:locations[i].location,
        animation: google.maps.Animation.DROP,
        map: bootMap});
        google.maps.event.addListener(marker, 'click',map.getGraduatesByLocation);
  },
  getGraduatesByLocation: function(){
    var ajaxCall = $.ajax({
      url: '/graduates/by_location',
      type: 'get',
      //data:
    })
    ajaxCall.done(test);
    ajaxCall.fail(test);
  }

  }
