rand = require 'generate-key'

module.exports = (db, models)->
   db.define 'coupons_vouchers',
      pub_id: 'text'
      used: Boolean
   ,
      timestamp: true
      hooks:
         beforeCreate: ->
            @pub_id = rand.generateKey 15
      validations:
         pub_id: db.enforce.unique()
