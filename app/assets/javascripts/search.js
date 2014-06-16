$(document).ready(function(){
  view = new View()
  bootTrack = new BootTrack(view)
  bootTrack.start();
})

function BootTrack(view) { //Main controller.
  this.view = view
}

BootTrack.prototype = {
  start: function(){
    $('form').on('submit', this.getGraduates)
    $('[data-comp="topbar"]').on('click', '[data-comp="search-again"]', this.view.searchAgain)
    $('[data-comp="topbar"]').on('click', '[data-comp="view-map"]',test)
    $('.card-container').on('click', this.view.contact, this.showForm)
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
  },

  showForm: function(){
    view.displayForm();
  }

}

function View(){
  this.contact = $('.contact button')
};

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
    var grad_template = "{{#graduates}}<div class='card'><img src='{{picture}}'><h3>{{name}}</h3>DBC {{campus}}<br>{{start_date}}<br>{{employer}}<br>{{location}}<br><br><button class='contact'>Contact Me!</button></div>{{/graduates}}";
    var html = Mustache.to_html(grad_template, res);
    $(".card-container").html(html);
  },

  displayForm: function(){
    $('.contacting').show();
    var form_template = "Send them a message!<button class='x-button'>x</button><form class='contact-form'>Name:<input type='text' name='user_name'><br>Your email:<input type='text' name='user_email'><br>Message:<input type='text' name='message'></form>";
    var content = Mustache.to_html(form_template)
    $('.contacting').html(content);
  }
};


 function test(res){
  console.log("You've hit the test function. Congratulations.")
  debugger
 }


