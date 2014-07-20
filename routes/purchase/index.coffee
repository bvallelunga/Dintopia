module.exports.index = (req, res, next)->
   res.render "purchase/index",
      title: "Big Ass Burger"
      js: req.coffee.renderTags "purchase"
      css: req.less.renderTags "purchase"
      coupon:
         pub_id   : "adsfasdfasdf"
         company  : "Custom Burgers"
         meal     : "Big Ass Burger"
         distance : "1 mile away"
         price    : 25.00
         discount : 0.05
         image    : "http://www.foodandwine.com/images/sys/201010-best-burger-custom-house-tavern-ss.jpg"

module.exports.purchase = (req, res, next)->
   req.models.users.get req.session.user.id, (error, user)->
      if not error and user
         user.addCard(req.param("card")).then (user)->
            req.session.user = user
            req.session.save()

            res.json
               success: true,
               next: "/voucher/" + user.pub_id + "/"
