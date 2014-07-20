rand = require 'generate-key'

module.exports = (db, models)->
   db.define 'coupons',
      pub_id: 'text'
      name:
         type: 'text'
         required: true
      original: Number
      discount: Number
      image   : "text"
   ,
      timestamp: true
      hooks:
         beforeCreate: ->
            @pub_id = rand.generateKey 15
            @discount = Math.random() * 5
      validations:
         pub_id: db.enforce.unique()
