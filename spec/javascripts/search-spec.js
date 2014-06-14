describe("Search", function() {
  beforeEach (function() {
    var search = new Search()
  });

  it("should exist", function() {
    expect(search.toBeDefined);
  });

  it("should call the getGraduates function", function() {

    spyOn(search, "getGraduates")
    search.getGraduates()
    // $('form').submit()
    expect(search.getGraduates).toHaveBeenCalled()
  })
});