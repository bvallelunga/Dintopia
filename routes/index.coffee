module.exports.init = (app)->
   require("./routes") (routes)->
      for name, route of routes
         if route.route
            route.route app, routes

      app.all "*", routes.error

module.exports.route = (req, res, next)->
   require("./routes") (routes)->
      req.routes = routes
      next()
