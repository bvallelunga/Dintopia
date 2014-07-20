exports.report = (error)->
   try
      if error
         if (Array.isArray error and not error.empty) or not $.isEmptyObject error
            console.error error
      else if error
         console.error error.code
         console.error error
   catch error
      exports.report error

exports.capture = (data, callback)->
   # True Means It Is On Init
   if data is true
      # Return Blank Function
      ->
   else
      ###
         var data is now seen as
         error. Now check if it
         contains an error.
      ###
      if callback
         exports.report data
         callback()
      else
         exports.report data
