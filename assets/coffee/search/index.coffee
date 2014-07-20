$(window).ready ->
   $("body > .search").css
      top: $("body > .header").outerHeight()
      height: $("body > .header").outerHeight() - $(window).outerHeight()

   map = new google.maps.Map $('.map').get(0),
      zoom: 4
      center: new google.maps.LatLng(39, -108)
      mapTypeId: google.maps.MapTypeId.ROADMAP

$(window).resize ->
   $("body > .search").css
      height: $("body > .header").outerHeight() - $(window).outerHeight()
