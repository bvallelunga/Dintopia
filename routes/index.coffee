module.exports = (app)->
    require("./routes") (routes)->
        for name, route of routes
            if route.route
                route.route app, routes

        app.all "*", routes.error
