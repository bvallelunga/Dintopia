module.exports.index = (req, res, next) ->
   lib.twitter(req.session.server).getRequestToken (error, requestToken, requestTokenSecret, results)->
      unless error
         req.session.twitterToken  = requestToken
         req.session.twitterSecret = requestTokenSecret
         res.redirect "https://twitter.com/oauth/authorize?oauth_token=#{requestToken}"
      else
         lib.error.capture error
         req.routes.error req, res, next

module.exports.callback = (req, res, next) ->
   twitter = lib.twitter(req.session.server)

   twitter.getAccessToken(
      req.session.twitterToken,
      req.session.twitterSecret,
      req.query.oauth_verifier,
      (error, accessToken, accessTokenSecret, results)->
         unless error
            twitter.verifyCredentials accessToken, accessTokenSecret, (error, data, response)->
               unless error
                  req.models.users.twitterAuth(data)
                     .then (user) ->
                        req.session.user = user
                        req.session.save()

                        res.redirect "/"
                     .catch (error) ->
                        lib.error.capture error
                        req.routes.error req, res, next
               else
                  lib.error.capture error
                  req.routes.error req, res, next
         else
            lib.error.capture error
            req.routes.error req, res, next
   )
