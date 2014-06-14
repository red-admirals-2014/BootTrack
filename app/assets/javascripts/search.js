$(document).ready(function(){
  search = new Search()
  search.start();
})

function Search() {
}

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

 function test(res){
  debugger
  console.log("test")
 }

var person = {
    firstName: "Christophe",
    lastName: "Coenraets",
    blogURL: "http://coenraets.org"
};
var template = "<h1>{{firstName}} {{lastName}}</h1>Blog: {{blogURL}}";
var html = Mustache.to_html(template, person);
