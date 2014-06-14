$(document).ready(function(){
  page = new Page
  page.start();
})

function Page(){
}

Page.prototype = {
  start: function(){
    $('form').on('submit',test)
  },
  getGraduates: function(){
    var ajaxCall = $ajax({
      url: '/graduates/search',
      type: 'get',
      data: $('form').serialize()
    })
    ajaxCall.done(test
  }
}

 function test(e){
  e.preventDefault()
  debugger
 }
