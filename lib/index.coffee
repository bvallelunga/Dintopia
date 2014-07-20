module.exports =
   core     : require './core'
   models   : require './models'
   error    : require './error'
   init     : (ejs)->
      @core.helpers()
      @core.filters ejs
