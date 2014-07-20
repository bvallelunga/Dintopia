module.exports.index = (req, res, next)->
   res.render "search/index",
      title: false
      search: req.param("q")
      js: req.coffee.renderTags "search"
      css: req.less.renderTags "search"
      config: search : req.param("q")
