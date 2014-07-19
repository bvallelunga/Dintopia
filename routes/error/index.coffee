module.exports = (req, res, next)->
   res.render "404",
      title: "404"
      js: req.coffee.renderTags "404"
      css: req.less.renderTags "404"
