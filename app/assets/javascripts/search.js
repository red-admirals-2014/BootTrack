$(document).ready(function(){
  view = new View()
  bootTrack = new BootTrack(view)
  bootTrack.start();
  $('#map-canvas').hide()
  google.maps.event.addDomListener(window, 'load', initialize);
})


function BootTrack(view) { //Main controller.
  this.view = view
}

BootTrack.prototype = {
  start: function(){
    $('form').on('submit', this.getGraduates)
    $('[data-comp="topbar"]').on('click', '[data-comp="search-again"]', this.view.searchAgain)
    $('[data-comp="topbar"]').on('click', '[data-comp="view-map"]',test)
  },

  getGraduates: function(e){
    e.preventDefault()
    var ajaxCall = $.ajax({
      url: '/graduates/search',
      type: 'get',
      data: $('form').serialize()
    })
    ajaxCall.done(view.showGrads);
    ajaxCall.fail(test);
  }

}

function View(){};

View.prototype = {
  searchAgain: function(e){
    e.preventDefault();
    $(".card-container").html("")
    $('.hidable').show()
    $('[data-comp="topbar"]').hide();
  },

  showGrads: function(res){
  $('[data-comp="topbar"]').show();
  $('.hidable').hide();
  var grad_template = "{{#graduates}}<div class='card'><img src='{{picture}}'><h3>{{name}}</h3>DBC {{campus}}<br>{{start_date}}<br>{{employer}}<br>{{location}}<br><br><button>Contact Me!</button></div>{{/graduates}}";
  var html = Mustache.to_html(grad_template, res);
  $(".card-container").html(html);
  }
};


function test(res){
  res.preventDefault()
  console.log("You've hit the test function. Congratulations.")
  debugger
}

function initialize() {
  var mapOptions = {
    zoom: 5,
    center: new google.maps.LatLng(34.0000, -98.5795)
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);
  var contentTemplate = ""
  var contentString = ""
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