$(document).ready(function(){
  page = new Page
  page.start();
})

function Page(){
}

Page.prototype = {
  start: function(){
    $('form').on('submit',test)
  }
}


 function test(e){
  e.preventDefault()
   //debugger
   //$('form').serialize()
 }
