describe("Search", function() {
  beforeEach (function() {
    var search = new search()
  });

  it("should exist", function() {
    expect(search.toBeDefined);
  });

  xit("should call the getGraduates function", function() {

    spyOn(search, "getGraduates")
    search.getGraduates()
    // $('form').submit()
    expect(search.getGraduates).toHaveBeenCalled()
  })
});