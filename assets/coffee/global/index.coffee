$(window).ready ->
   $(".google-search").each ()->
      new google.maps.places.Autocomplete $(@).get 0
