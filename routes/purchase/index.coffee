module.exports.index = (req, res, next)->
   req.models.coupons.one
      pub_id: req.param "coupon"
   , (error, coupon)->
      if not error and coupon
         res.render "purchase/index",
            title: coupon.name
            js: req.coffee.renderTags "purchase"
            css: req.less.renderTags "purchase"
            coupon: coupon
      else
         req.routes.error req, res, next
         lib.error.capture error

module.exports.purchase = (req, res, next)->
   req.models.users.get req.session.user.id, (error, user)->
      if not error and user
         user.addCard(req.param("card")).then (user)->
            req.session.user = user
            req.session.save()

            req.models.coupons.one
               pub_id: req.param "coupon"
            , (error, coupon)->
               unless error
                  coupon.createVoucher(user)
                     .then (voucher)->
                        res.json
                           success: true,
                           next: "/voucher/#{voucher.pub_id}/"

                     .catch (error)->
                        res.json success: fale
                        lib.error.capture error

               else
                  res.json success: fale
                  lib.error.capture error
      else
         res.json
            success: true,
            next: "/logout/"
