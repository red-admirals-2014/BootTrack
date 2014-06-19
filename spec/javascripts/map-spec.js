describe("Map", function() {
  beforeEach (function() {
    var map = new Map()
  })

  it("should exist", function() {
    expect(map.toBeDefined);
  });

  it("should call the getPins function", function() {
    spyOn(map, "getPins")
    map.getPins()
    expect(map.getPins).toHaveBeenCalled()
  });

  it("should call the showMap function", function() {
    spyOn(map, "showMap")
    map.showMap()
    expect(map.showMap).toHaveBeenCalled()
  });

})