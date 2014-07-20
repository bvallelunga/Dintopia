$(window).ready ->
   $(".google-search").each ()->
      new google.maps.places.Autocomplete $(@).get 0

   $(".grid .information").hAlign().vAlign()
   $(".grid .pricing").hAlign()
