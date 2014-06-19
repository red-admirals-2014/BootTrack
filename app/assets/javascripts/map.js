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
    $('#map-canvas').show()
    map.initialize()
    locations = response.locations
    for(var i = 1; i<locations.length; i++){
     map.getPins(i)
    }
    $(".card-container").html("")
  },
  getPins: function(i){
        var myLatlng = new google.maps.LatLng(locations[i].latitude,locations[i].longitude)
        var marker = new google.maps.Marker({
        position: myLatlng,
        location: locations[i].location,
        numBoots: locations[i].grads_number,
        title: locations[i].location+', Number of Boots: '+locations[i].grads_number,
        animation: google.maps.Animation.DROP,
        map: bootMap});
        google.maps.event.addListener(marker, 'click',map.getGraduatesByLocation);
  },
  getGraduatesByLocation: function(){
    var ajaxCall = $.ajax({
      url: '/graduates/by_location',
      type: 'get',
      data: "location="+this.title
    })
    ajaxCall.done(map.showMapCards);
    ajaxCall.fail(test);
  },
  showMapCards: function(response){
    $('.map-card-container').show()
    var grad_template = "{{#graduates}}<div class='card'><img src='{{picture}}'><h3>{{name}}</h3>DBC {{campus}}<br>{{start_date}}<br>{{employer}}<br>{{location}}<br><br><button id={{id}} class='contact'>Contact Me!</button></div>{{/graduates}}";
    var html = Mustache.to_html(grad_template, response);
    $(".map-card-container").html(html);

  }
  }
