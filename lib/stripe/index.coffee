module.exports = require("stripe") (->
   if config.general.production
      return config.stripe.production
   else
      return config.stripe.development
)()
