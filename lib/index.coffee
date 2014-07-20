module.exports =
   core     : require './core'
   models   : require './models'
   twitter  : require './twitter'
   engines  : require './engines'
   redis    : require './redis'
   error    : require './error'
   init     : (ejs)->
      @core.helpers()
      @core.filters ejs
