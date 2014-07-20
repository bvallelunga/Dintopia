module.exports.index = (req, res, next)->
   req.models.coupons.all (error, coupons)->
      unless error
         res.render "search/index",
            title: req.param("q") or ""
            search: req.param("q") or ""
            config: search : req.param("q") or ""
            js: req.coffee.renderTags "search"
            css: req.less.renderTags "search"
            coupons: coupons
      else
         req.routes.error req, res, next
         lib.error.capture error
