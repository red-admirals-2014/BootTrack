describe("Controller",function(){
  beforeEach (function() {
    var bootTrack = new BootTrack()
  });

  it("should exist", function() {
    expect(bootTrack.toBeDefined);
  });

  it("should call the start function", function() {

    spyOn(bootTrack, "start")
    bootTrack.start()
    expect(bootTrack.start).toHaveBeenCalled()
  });

  it("should call the getGraduates function", function () {
    spyOn(bootTrack, "getGraduates")
    bootTrack.getGraduates()
    expect(bootTrack.getGraduates).toHaveBeenCalled()
  });

  it("should call the sendEmail function", function() {
    spyOn(bootTrack, "sendEmail")
    bootTrack.sendEmail()
    expect(bootTrack.sendEmail).toHaveBeenCalled()
  })
  describe("getGraduates", function() {
    var successfulAJAX = function() {
      return { done: function(callback) { callback() },
               fail: function() { }
             }
      }
      var failingAJAX = function() {
      return { done: function() { },
               fail: function(callback) { callback()}
             }
      }
    beforeEach (function() {

    var bootTrack = new BootTrack()
    });
    it ("should call the showGrads method on AJAX success", function(){
    $.ajax = successfulAJAX
    spyOn(bootTrack.view, "showGrads")
      var event = { preventDefault: function(){}}
    bootTrack.getGraduates(event)
    expect(bootTrack.view.showGrads).toHaveBeenCalled()
    })
    xit ("should not call the showGrads method on AJAX failure", function(){
    $.ajax = failingAJAX
    spyOn(bootTrack.view, "showGrads")
      var event = { preventDefault: function(){}}
    bootTrack.getGraduates(event)
    expect(bootTrack.view.test).toHaveBeenCalled()
    })
  })
});


