var mockAjax = function() {
  beforeEach(function() {
    jasmine.Ajax.install();
  })
  afterEach(function() {
    jasmine.Ajax.uninstall();
  })
}
var lastRequest = function() {
  return jasmine.Ajax.requests.mostRecent();
}

var respondWithSuccess = function() {
  lastRequest().response({
    "status": 200,
    "contentType": "text./plain"
  });
}

var respondWithError = function() {
  lastRequest().response({
    "status": 500,
    "contentType": "text./plain"
  });
}