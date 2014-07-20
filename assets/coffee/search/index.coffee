$(window).ready ->
   map = new google.maps.Map $('.map').get(0),
      zoom: 4
      center: new google.maps.LatLng(39, -108)
      mapTypeId: google.maps.MapTypeId.ROADMAP
