$ ->
   $("body > .search").css
      top: $("body > .header").outerHeight()
      height: "#{$(window).outerHeight()- $("body > .header").outerHeight()}px"
   $("body > .search .purchase").hAlign().vAlign()

   options = {}

   if config.search
      setUpMap address: config.search
   else if navigator.geolocation
      localLatLng (latLng)->
         setUpMap latLng: new google.maps.LatLng latLng.latitude, latLng.longitude

$(window).resize ->
   $("body > .search").css
      height: "#{$(window).outerHeight()- $("body > .header").outerHeight()}px"

localLatLng = (cb)->
   navigator.geolocation.getCurrentPosition (search)->
      cb search.coords

toRad = (num)->
   return num * Math.PI / 180

haversine = (start, end, options)->
   km    = 6371
   mile  = 3960
   options ?= {}

   R = if options.unit is 'mile' then mile else km

   dLat = toRad (end.latitude - start.latitude)
   dLon = toRad (end.longitude - start.longitude)
   lat1 = toRad start.latitude
   lat2 = toRad end.latitude
   a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2)
   c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

   if options.threshold
      return options.threshold > (R * c)
   else
      return R * c

setUpMap = (options)->
   geocoder = new google.maps.Geocoder()
   geocoder.geocode options, (results, status)->
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

      $(".coupons .item").each ->
         lat = parseFloat($(@).data("lat"))
         ln  = parseFloat($(@).data("lng"))
         latLng = new google.maps.LatLng(lat, ln)

         localLatLng (myLatLng)=>
            distance = haversine(
               latitude: lat
               longitude: ln
            , myLatLng,
               unit: 'mile'
            )

            $(@).find(".distance").text "#{distance.toFixed(2)} miles away..."

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
