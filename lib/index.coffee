module.exports =
   core     : require './core'
   models   : require './models'
   engines  : require './engines'
   error    : require './error'
   init     : (ejs)->
      @core.helpers()
      @core.filters ejs
