$(window).ready ->
   $(".grid .information").hAlign().vAlign()
   $(".grid .pricing").hAlign()

   if navigator.geolocation
      placeholder = $(".google-search").attr "placeholder"
      $(".google-search").attr placeholder: "hold on, we're finding your location..."

      navigator.geolocation.getCurrentPosition (search)->
         latLng   = new google.maps.LatLng search.coords.latitude, search.coords.longitude
         geocoder = new google.maps.Geocoder()
         geocoder.geocode
            latLng: latLng
         , (results)->
            $.each results, (i, address)->
               if address.types[0] == "neighborhood"
                  $(".google-search").val address.formatted_address

            $(".google-search").attr placeholder: placeholder
