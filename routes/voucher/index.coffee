module.exports = (req, res, next) ->
   res.render "voucher/index",
      title: "Big Ass Burger"
      js: req.coffee.renderTags "voucher"
      css: req.less.renderTags "voucher"
      voucher:
         pub_id   : "adsfasdfasdf"
         company  : "Custom Burgers"
         location :
            street: "450 Market Street"
            city  : "San Fransisco"
            state : "CA"
            zip   : "90250"
         meal     : "Big Ass Burger"
         distance : "1 mile away"
         price    : 25.00
         discount : 0.05
         image    : "http://www.foodandwine.com/images/sys/201010-best-burger-custom-house-tavern-ss.jpg"
