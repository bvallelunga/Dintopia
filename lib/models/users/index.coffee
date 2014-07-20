rand = require 'generate-key'

module.exports = (db, models)->
   users = db.define 'users',
      pub_id: 'text'
      name:
         type: 'text'
         required: true
      screen_name: 'text'
      profile_image: 'text'
   ,
      timestamp: true
      hooks:
         beforeCreate: ->
            @pub_id = rand.generateKey 15
      validations:
         pub_id: db.enforce.unique()
      methods:
         score: (company, cb)->
            models.visits.count
               user: @
               company: company
            ,
               (err, count)->
                  if err
                     lib.error.capture err
                  else
                     lib.engines.loyalty count, cb

   users.twitterAuth = (data)->
      Promise (resolve) ->
         users.one
            screen_name: data["screen_name"]
         , (error, user)->
            unless error
               if user
                  resolve null, user
               else
                  users.create
                     name: data["name"]
                     screen_name: data["screen_name"]
                     profile_image: data["profile_image_url_https"]
                  , resolve
            else
               resolve error

   return users
