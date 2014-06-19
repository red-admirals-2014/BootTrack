function Map() {};

Map.prototype = {
  initialize: function(markers){
    var mapOptions = {
      zoom: 4,
      center: new google.maps.LatLng(34.0000, -98.5795),
      styles: this.mapStyles()
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
    $('.contacting').hide();
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
    google.maps.event.addListener(marker, 'click',function(response){
      map.getGraduatesByLocation(response, this.location)
      new google.maps.InfoWindow({
        content: locations[i].location+', Number of Boots: '+locations[i].grads_number
      }).open(bootMap,marker);
    });
    // google.maps.event.addListener(marker, 'click', function() {
    //   new google.maps.InfoWindow({
    //     content: locations[i].location+', Number of Boots: '+locations[i].grads_number
    //   }).open(bootMap,marker);
    // });
  },
  getGraduatesByLocation: function(response, location){
    var ajaxCall = $.ajax({
      url: '/graduates/by_location',
      type: 'get',
      data: "location="+location
    })
    ajaxCall.done(map.showMapCards);
    ajaxCall.fail(test);
  },
  showMapCards: function(response){
    // debugger
    // new google.maps.InfoWindow({
    //   content: response.graduates[0].location+', # of Boots: '+response.graduates.length
    // }).open(bootMap,marker)
    $('.map-card-container').show()
    var grad_template = "{{#graduates}}<div class='card'><img src='{{picture}}'><h3>{{name}}</h3>DBC {{campus}}<br>{{start_date}}<br>{{employer}}<br>{{location}}<br><br><button id={{id}} class='contact'>Contact Me!</button></div>{{/graduates}}";
    var html = Mustache.to_html(grad_template, response);
    $(".map-card-container").html(html);
  },
  mapStyles: function(){
    var styles = [{"featureType":"landscape","stylers":[{"hue":"#F1FF00"},{"saturation":-27.4},{"lightness":9.4},{"gamma":1}]},{"featureType":"road.highway","stylers":[{"hue":"#0099FF"},{"saturation":-20},{"lightness":36.4},{"gamma":1}]},{"featureType":"road.arterial","stylers":[{"hue":"#00FF4F"},{"saturation":0},{"lightness":0},{"gamma":1}]},{"featureType":"road.local","stylers":[{"hue":"#FFB300"},{"saturation":-38},{"lightness":11.2},{"gamma":1}]},{"featureType":"water","stylers":[{"hue":"#00B6FF"},{"saturation":4.2},{"lightness":-63.4},{"gamma":1}]},{"featureType":"poi","stylers":[{"hue":"#9FFF00"},{"saturation":0},{"lightness":0},{"gamma":1}]}]
  return styles;
  }
}
