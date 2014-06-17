describe("Map", function() {
  beforeEach (function() {
    var map = new Map()
  })

  it("should exist", function() {
    expect(map.toBeDefined);
  });

  it("should call the setMarkers function", function() {
    spyOn(map, "setMarkers")
    map.setMarkers()
    expect(map.setMarkers).toHaveBeenCalled()
  });

  it("should call the showMap function", function() {
    spyOn(map, "showMap")
    map.showMap()
    expect(map.showMap).toHaveBeenCalled()
  });

})