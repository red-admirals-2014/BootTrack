$(document).ready(function(){
  view = new View()
  map = new Map();
  bootTrack = new BootTrack(view, map)
  bootTrack.start();
})

