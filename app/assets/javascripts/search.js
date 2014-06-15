// $(document).ready(function(){
//   search = new Search()
//   search.start();
// })

function Search() {}

Search.prototype = {
  start: function(){
    $('form').on('submit', this.getGraduates)
    $('[data-comp="topbar"]').on('click', '[data-comp="search-again"]', this.searchAgain)
    $('[data-comp="topbar"]').on('click', '[data-comp="view-map"]',test)
  },

  getGraduates: function(e){
    e.preventDefault()
    var ajaxCall = $.ajax({
      url: '/graduates/search',
      type: 'get',
      data: $('form').serialize()
    })
    ajaxCall.done(showGrads)
    ajaxCall.fail(test)
  },
  searchAgain: function(e){
    e.preventDefault()
    $(".card-container").html("")
    $('.hidable').show()
  }
}

 function test(res){
  debugger
  console.log("test")
 }

function showGrads(res){
  $('.hidable').hide()
  var grad_template = "{{#graduates}}<div class='card'><img src='{{picture}}'><h3>{{name}}</h3>DBC {{campus}}<br>{{start_date}}<br>{{employer}}<br>{{location}}<br><br><button>Contact Me!</button></div>{{/graduates}}";
  var html = Mustache.to_html(grad_template, res);
  $(".card-container").html(html)
}
