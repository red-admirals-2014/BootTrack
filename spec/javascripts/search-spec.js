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
    // $('form').submit()
    expect(bootTrack.start).toHaveBeenCalled()
  })
});