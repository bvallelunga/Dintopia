rand = require 'generate-key'

module.exports = (db, models)->
   db.define 'coupons',
      pub_id: 'text'
      name:
         type: 'text'
         required: true
      price: Number
      discount: Number
      image   : "text"
   ,
      timestamp: true
      methods:
         createVoucher: (user)->
            Promise (resolve) =>
               models.coupons.vouchers.create
                  owner_id: user.id
                  coupon_id:  @id
               , resolve
      hooks:
         beforeCreate: ->
            @pub_id = rand.generateKey 15
            @discount = parseFloat (((Math.random() * 8) + 2)/100).toFixed 2
      validations:
         pub_id: db.enforce.unique()
