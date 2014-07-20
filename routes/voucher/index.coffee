module.exports = (req, res, next) ->
   req.models.coupons.vouchers.one
      pub_id:  req.param "voucher"
      owner_id: req.session.user.id
   , (error, voucher)->
      unless error
         res.render "voucher/index",
            title: "Big Ass Burger"
            js: req.coffee.renderTags "voucher"
            css: req.less.renderTags "voucher"
            voucher: voucher
      else
         req.routes.error req, res, next
         lib.error.capture error
