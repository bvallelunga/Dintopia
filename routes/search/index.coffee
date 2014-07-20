module.exports.index = (req, res, next)->
   console.log req.param("q")
   res.render "search/index",
      title: false
      search: req.param("q")
      js: req.coffee.renderTags "search"
      css: req.less.renderTags "search"
