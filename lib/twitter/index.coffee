twitterAPI = require 'node-twitter-api'
twitter    = null

module.exports = (host)->
   unless twitter
      return twitter = new twitterAPI
          consumerKey: config.twitter.key
          consumerSecret: config.twitter.secret
          callback: "#{host}/twitter/callback"
   else
      return twitter
