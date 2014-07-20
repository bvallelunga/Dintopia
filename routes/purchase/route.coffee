module.exports = (app, routes)->
    app.get '/purchase/:coupon', routes.auth.restrict, routes.purchase.index
    app.post '/purchase/:coupon', routes.auth.restrict, routes.purchase.purchase
