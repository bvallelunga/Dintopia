module.exports = (app, routes)->
    app.get '/twitter', routes.twitter.index
    app.get '/twitter/callback', routes.twitter.callback
