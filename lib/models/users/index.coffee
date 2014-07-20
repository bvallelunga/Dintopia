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
   ,
      timestamp: true
      hooks:
         beforeCreate: ->
            @pub_id = rand.generateKey 15
      validations:
         pub_id: db.enforce.unique()
      methods:
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
