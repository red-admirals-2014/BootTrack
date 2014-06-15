$(document).ready(function(){
  search = new Search()
  search.start();
})

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

 function test(res){
  debugger
  console.log("test")
 }

function showGrads(res){
  var grad_template = "<div class='card-container'>{{#graduates}}<div class='card'><h3>{{& name}}</h3>{{& campus}}<br>{{& s_date}}<br></div>{{/graduates}}</div>";
  var html = Mustache.to_html(grad_template, res);
  $("[data-comp='main']").html(html)
}
