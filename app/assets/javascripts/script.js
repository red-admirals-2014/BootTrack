$(document).ready(function(){
  page = new Page
  page.start();
})

function Page(){
}

Page.prototype = {
  start: function(){
    $('form').on('submit', this.getGraduates)
  },
  getGraduates: function(e){
    e.preventDefault
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
  debugger
 }
