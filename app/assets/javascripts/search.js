function Search() {}

Search.prototype = {
  start: function(){
    $('form').on('submit', this.getGraduates)
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
  }
}

 function test(results){
  debugger
  console.log("test")
 }

// graduates, name, campus, and start_date are pulling
// info from the database that is retrieved from
// the DBC api. They are the names as dictated by
// the DBC api.

function showGrads(results){
  var gradTemplate = "<div class='card-container'>{{#graduates}}<div class='card'><h3>{{name}}</h3>DBC {{campus}}<br>{{start_date}}<br><button>Contact Me!</button></div>{{/graduates}}</div>";
  var html = Mustache.to_html(gradTemplate, results);
  $("[data-comp='main']").html(html)
}


