$(document).ready ->
   $("body > .search").css
      top: $("body > .header").outerHeight()
      height: "#{$(window).outerHeight()- $("body > .header").outerHeight()}px"

   geocoder = new google.maps.Geocoder()
   geocoder.geocode
      address: config.search
   , (results, status)->
      map = new google.maps.Map $('.map').get(0),
         zoom     : 15
         center   : results[0].geometry.location
         mapTypeId: google.maps.MapTypeId.ROADMAP
         disableDefaultUI: true
         zoomControl: true,
         zoomControlOptions: style:google.maps.ZoomControlStyle.SMALL

$(window).resize ->
   $("body > .search").css
      height: "#{$(window).outerHeight()- $("body > .header").outerHeight()}px"
