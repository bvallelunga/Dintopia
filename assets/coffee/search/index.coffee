$(document).ready ->
   $("body > .search").css
      top: $("body > .header").outerHeight()
      height: "#{$(window).outerHeight()- $("body > .header").outerHeight()}px"
   $("body > .search .purchase").hAlign().vAlign()

   geocoder = new google.maps.Geocoder()
   geocoder.geocode
      address: config.search
   , (results, status)->
      pin =
         url: "/img/search/pin.png"
         size: new google.maps.Size(50, 74),
         scaledSize: new google.maps.Size(25, 37)
         origin: new google.maps.Point(0,0),
         anchor: new google.maps.Point(0, 32)

      pin_hover =
         url: "/img/search/pin_hover.png"
         size: new google.maps.Size(50, 74),
         scaledSize: new google.maps.Size(25, 37)
         origin: new google.maps.Point(0,0),
         anchor: new google.maps.Point(0, 32)

      map = new google.maps.Map $('.map').get(0),
         zoom     : 15
         center   : results[0].geometry.location
         mapTypeId: google.maps.MapTypeId.ROADMAP
         disableDefaultUI: true
         zoomControl: true,
         zoomControlOptions: style:google.maps.ZoomControlStyle.SMALL

      $(".results .item").each ->
         lat = parseFloat($(@).data("lat"))
         ln  = parseFloat($(@).data("lng"))
         latLng = new google.maps.LatLng(lat, ln)

         marker = new google.maps.Marker
            position: latLng
            map: map
            icon: pin

         $(@).mouseover -> marker.setIcon pin_hover
         $(@).mouseout -> marker.setIcon pin

         google.maps.event.addListener marker, 'click', =>
            window.location.href = $(@).attr "href"
         google.maps.event.addListener marker, 'mouseover', =>
            $(@).addClass "hover"
            marker.setIcon pin_hover
         google.maps.event.addListener marker, 'mouseout', =>
            $(@).removeClass "hover"
            marker.setIcon pin

$(window).resize ->
   $("body > .search").css
      height: "#{$(window).outerHeight()- $("body > .header").outerHeight()}px"
