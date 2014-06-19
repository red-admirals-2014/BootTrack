function BootTrack(view, map) { //Main controller.
  this.view = view
  this.map = map
  this.currentSearch ={campus: '', year: ''}
}

BootTrack.prototype = {
  start: function(){
    $('form.index-search').on('submit', this.getGraduates)
    $('[data-comp="topbar"]').on('click', '[data-comp="search-again"]', this.view.searchAgain)
    $('[data-comp="topbar"]').on('click', '[data-comp="view-map"]', this.getLocation)
    $('.card-container').on('click', this.view.contact, this.showForm)
    $('.contacting').on('click', this.view.x_button, this.hideForm)
    $('.contact-form').on('click', this.view.email_button, this.sendEmail)
  },

  getGraduates: function(e){
    e.preventDefault()
    var ajaxCall = $.ajax({
      url: '/graduates/search',
      type: 'get',
      data: $('form.index-search').serialize()
    })
    ajaxCall.done(view.showGrads);
    ajaxCall.fail(test);
  },
  getLocation: function(e){
    e.preventDefault()
    var ajaxCall = $.ajax({
      url: '/graduates/locations',
      type: 'get'
    })
    ajaxCall.done(map.showMap);
    ajaxCall.fail(test);
  },
  showForm: function(e){
    id = this.id
    view.displayForm(id);
  },

   hideForm: function(){
    view.nixForm();
  },

 sendEmail: function(e){
  debugger
  e.preventDefault();
    var request = $.ajax({
        type: 'POST',
        url: '/graduates/mail',
        data: $('form.contact-form').serialize(),
        success: function (data) {
            alert('ok');
        }
    });
    view.nixForm();
 },

}

function View(){
  this.contact = '.contact'
  this.x_button = '.x-button'
  this.email_button = '.send-email'
};

View.prototype = {
  searchAgain: function(e){
    e.preventDefault();
    $('#map-canvas').hide()
    $('.map-card-container').hide()
    $('#map-canvas').html("")
    $(".card-container").html("")
    $('.hidable').show()
    $('[data-comp="topbar"]').hide();
  },

  showGrads: function(res){
    $('[data-comp="topbar"]').show();
    $('.hidable').hide();
    var grad_template = "{{#graduates}}<div class='card'><img src='{{picture}}'><h3>{{name}}</h3>DBC {{campus}}<br>{{start_date}}<br>{{employer}}<br>{{location}}<br><br><button id={{id}} class='contact'>Contact Me!</button></div>{{/graduates}}";
    var html = Mustache.to_html(grad_template, res);
    $(".card-container").html(html);
  },

   displayForm: function(id){
    $('.contacting').show();
    $('input.has_id').attr("value", id)
  },

  nixForm: function(){
    $('.contacting').hide();
  },

};


 function test(response){
  console.log("You've hit the test function. Congratulations.")
  debugger
 }


