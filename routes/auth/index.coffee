module.exports.restrict = (req, res, next)->
   unless req.session.user
      res.redirect "/twitter?next=#{encodeURIComponent(req.url)}"
   else
      next()

module.exports.logout = (req, res, next)->
   delete req.session.user
   req.session.save()
   res.redirect "/"
