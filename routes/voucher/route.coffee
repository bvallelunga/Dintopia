module.exports = (app, routes)->
    app.get '/voucher/:voucher', routes.auth.restrict, routes.voucher
