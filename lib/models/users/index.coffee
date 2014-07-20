rand = require 'generate-key'

module.exports = (db, models)->
   db.define 'users',
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
