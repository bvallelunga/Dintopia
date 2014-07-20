orm         = require "orm"
random      = require "orm-random"
modts       = require "orm-timestamps"
initialized = false

module.exports = orm.express config.orm,
   define: (db, models, cb)->
      # Settings
      db.settings.set "properties.primary_key", "id"
      db.settings.set "instance.cache", false
      db.settings.set "instance.autoSave", false
      db.settings.set "instance.autoFetch", false
      db.settings.set "instance.autoFetchLimit", 2

      # Use Plugins
      db.use random
      db.use modts,
         persist           : true
         createdProperty   : 'created'
         modifiedProperty  : 'modified'
         dbtype            :
            type: 'date'
            time: true
         now: -> return new Date()

      # Define Models
      models.users = require("./users") db, models
      models.companies = require("./companies") db, models
      models.visits = require("./visits") db, models

      # Associations
      models.visits.hasOne "user", models.users, reverse: "visits"
      models.visits.hasOne "company", models.companies, reverse: "visits"

      # Init
      unless initialized
         async.series [
            (next)->
               if config.orm.reset
                  db.drop next
               else next()

            , (next)->
               if config.orm.reset or config.orm.sync
                  db.sync next
               else next()

            , (next)->
               if config.orm.reset or config.orm.preload
                  require('./preload') models
               next()

         ], (errors)->
            initialized = true
            cb() if cb

      else if cb then cb()
