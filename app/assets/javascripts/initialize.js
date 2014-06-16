$(document).ready(function(){
  view = new View()
  bootTrack = new BootTrack(view)
  bootTrack.start();
  map = new Map();
  google.maps.event.addDomListener(window, 'load', map.initialize);
})

