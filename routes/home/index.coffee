module.exports = (req, res, next)->
   req.models.coupons.all (error, coupons)->
      unless error
         res.render "home/index",
            title: false
            js: req.coffee.renderTags "home"
            css: req.less.renderTags "home"
            coupons: coupons
      else
         req.routes.error req, res, next
         lib.error.capture error
