rand = require 'generate-key'

module.exports = (db, models)->
   users = db.define 'users',
      pub_id: 'text'
      name:
         type: 'text'
         required: true
   ,
      timestamp: true
      hooks:
         beforeCreate: ->
            @pub_id = rand.generateKey 15
      validations:
         pub_id: db.enforce.unique()

   users
