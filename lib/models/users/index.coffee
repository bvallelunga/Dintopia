crypto = require 'crypto'
rand = require 'generate-key'

module.exports = (db, models)->
   users = db.define 'users',
      pub_id: 'text'
      name:
         type: 'text'
         required: true
      screen_name: 'text'
      profile_image: 'text'
      card: Object,
      stripe: 'text'
   ,
      timestamp: true
      hooks:
         beforeCreate: ->
            @pub_id = rand.generateKey 15
         afterCreate: (success)->
            if success
               @addStripe()
      validations:
         pub_id: db.enforce.unique()
      methods:
         addStripe: ->
            lib.stripe.customers.create
               email: @email,
            , (error, customer)=>
               if !error and customer
                  @stripe = customer.id
                  @save()

         addCard: (card)->
            Promise (resolve) =>
               unless @card
                  lib.stripe.customers.createCard @stripe,
                     card:
                        name: card.name,
                        number: card.number,
                        exp_month: parseInt(card.expr.split("/")[0]),
                        exp_year: parseInt(card.expr.split("/")[1]),
                        cvc: card.cvc
                  , (error, card)=>
                     unless error and card
                        @card =
                           id: card.id,
                           name: card.name,
                           number: card.last4
                           type: card.brand.toLowerCase()

                        @save(resolve)
                     else
                        resolve error
               else
                  resolve null, @

         score: (company, cb)->
            async.parallel
               visitCount:
                  Promise (resolve)->
                     models.visits.count
                        user: @
                        company: company
                     ,
                        resolve
               randomScoreCache:
                  Promise (resolve)->
                     lib.redis.hgetall crypto.createHash('md5').update(
                        user: @id
                        company: company.id
                     ).digest 'hex',
                     resolve
            ,
               (err, res)->
                  if err
                     lib.error.capture err
                     return

                  loyaltyScore = lib.engines.loyalty res.visitCount
                  randomScore = lib.engines.random res.randomScoreCache

                  if randomScore is not cachedRandomScore.score
                     lib.redis.hmset crypto.createHash('md5').update(
                        user: @id
                        company: company.id
                     ).digest 'hex',
                        score: randomScore
                        timestamp: +moment()

                  cb loyaltyScore + randomScore

   users.twitterAuth = (data)->
      Promise (resolve) ->
         users.one
            screen_name: data["screen_name"]
         , (error, user)->
            unless error
               if user
                  resolve null, user
               else
                  users.create
                     name: data["name"]
                     screen_name: data["screen_name"]
                     profile_image: data["profile_image_url_https"]
                  , resolve
            else
               resolve error

   return users
