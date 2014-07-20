rand = require 'generate-key'

module.exports = (db, models)->
   companies = db.define 'companies',
      pub_id: 'text'
      name:
         type: 'text'
         required: true
      address: 'text'
      city: 'text'
      state: 'text'
      country: 'text'
      latitude: 'number'
      longitude: 'number'
   ,
      timestamp: true
      hooks:
         beforeCreate: ->
            @pub_id = rand.generateKey 15
      validations:
         pub_id: db.enforce.unique()

   companies
