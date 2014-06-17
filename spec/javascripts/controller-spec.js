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
    spyOn(bootTrack, "getGraduates")
    bootTrack.getGraduates()
    expect(bootTrack.showGrads).toHaveBeenCalledWith()
  })
});

