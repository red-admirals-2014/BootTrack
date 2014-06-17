describe("controller", function() {
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
  })

});