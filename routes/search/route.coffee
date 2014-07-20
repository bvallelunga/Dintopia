module.exports = (app, routes)->
    app.get '/search', routes.auth.restricted, routes.search.index
