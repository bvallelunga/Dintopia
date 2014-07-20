module.exports = (app, routes)->
    app.get '/search', routes.search.index
