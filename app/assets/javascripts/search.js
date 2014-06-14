$(document).ready(function(){
  search = new Search()
  search.start();
})

function Search() {
}

var person = {
  firstName: "Jordan",
  lastName: "Kamin"
};

var template = "<h2>{{firstName}} {{lastName}}</h2>"
var html = Mustache.to_html(template, person)



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
    ajaxCall.done(test)
    ajaxCall.fail(test)
  }
}

 function test(){
  $("[data-comp='footer']").html(html)
 }
