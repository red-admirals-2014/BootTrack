$(document).ready(function(){
  search = new Search()
  search.start();
  // var mapOptions = {
  //   center: new google.maps.LatLng(-34.397, 150.644),
  //   zoom: 8
  // };
  // var map = new google.maps.Map(document.getElementById("map-canvas"),
  //   mapOptions);

var map;
function initialize() {
  var mapOptions = {
    zoom: 5,
    center: new google.maps.LatLng(34.0000, -98.5795)
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
    mapOptions);


  var contentTemplate = ""

   // var contentString = '<div id="content">'+
   //    '<div id="siteNotice">'+
   //    '</div>'+
   //    '<h1 id="firstHeading" class="firstHeading">Hey Tiff</h1>'+
   //    '<div id="bodyContent">'+
   //    '<p><b>Look</b>, at what I can do!';

  var infowindow = new google.maps.InfoWindow({
      content: contentString
  })

  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(34.0000, -98.5795),
    map: map,
    title: 'Uluru (Ayers Rock)',
  });
  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
  });
}

google.maps.event.addDomListener(window, 'load', initialize);

})