function BootTrack(view, map) { //Main controller.
  this.view = view
  this.map = map
}

BootTrack.prototype = {
  start: function(){
    $('form').on('submit', this.getGraduates)
    $('[data-comp="topbar"]').on('click', '[data-comp="search-again"]', this.view.searchAgain)
    $('[data-comp="topbar"]').on('click', '[data-comp="view-map"]', map.showMap)
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
    $('#map-canvas').hide()
    $(".card-container").html("")
    $('.hidable').show()
    $('[data-comp="topbar"]').hide();
  },

  showGrads: function(res){
    debugger
  $('[data-comp="topbar"]').show();
  $('.hidable').hide();
  var grad_template = "{{#graduates}}<div class='card'><img src='{{picture}}'><h3>{{name}}</h3>DBC {{campus}}<br>{{start_date}}<br>{{employer}}<br>{{location}}<br><br><button>Contact Me!</button></div>{{/graduates}}";
  var html = Mustache.to_html(grad_template, res);
  $(".card-container").html(html);
  }
};


 function test(res){
  console.log("You've hit the test function. Congratulations.")
  debugger
 }


