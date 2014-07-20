module.exports = (req, res, next)->
    res.render "home/index",
      title: false
      js: req.coffee.renderTags "home"
      css: req.less.renderTags "home"
      coupons: [
         pub_id   : "adsfasdfasdf"
         company  : "Custom Burgers"
         meal     : "Big Ass Burger"
         distance : "1 mile away"
         price    : 25.00
         discount : 0.05
         image    : "http://www.foodandwine.com/images/sys/201010-best-burger-custom-house-tavern-ss.jpg"
      ,
         pub_id   : "adfw234sdfasdf"
         company  : "Denny's"
         meal     : "Steak Dinner"
         distance : "1 mile away"
         price    : 25.00
         discount : 0.05
         image    : "http://3.bp.blogspot.com/-GRFptl3IVno/Uv-_xHwAdvI/AAAAAAAANRk/JQX9brfnlnM/s1600/DSC_1863.JPG"
      ,
         pub_id   : "adsfasdfasdf"
         company  : "Custom Burgers"
         meal     : "Big Ass Burger"
         distance : "1 mile away"
         price    : 25.00
         discount : 0.05
         image    : "http://www.foodandwine.com/images/sys/201010-best-burger-custom-house-tavern-ss.jpg"
      ,
         pub_id   : "adfw234sdfasdf"
         company  : "Denny's"
         meal     : "Steak Dinner"
         distance : "1 mile away"
         price    : 25.00
         discount : 0.05
         image    : "http://3.bp.blogspot.com/-GRFptl3IVno/Uv-_xHwAdvI/AAAAAAAANRk/JQX9brfnlnM/s1600/DSC_1863.JPG"
      ,
         pub_id   : "adfw234sdfasdf"
         company  : "Denny's"
         meal     : "Steak Dinner"
         distance : "1 mile away"
         price    : 25.00
         discount : 0.05
         image    : "http://3.bp.blogspot.com/-GRFptl3IVno/Uv-_xHwAdvI/AAAAAAAANRk/JQX9brfnlnM/s1600/DSC_1863.JPG"
      ,
         pub_id   : "adsfasdfasdf"
         company  : "Custom Burgers"
         meal     : "Big Ass Burger"
         distance : "1 mile away"
         price    : 25.00
         discount : 0.05
         image    : "http://www.foodandwine.com/images/sys/201010-best-burger-custom-house-tavern-ss.jpg"
      ,
         pub_id   : "adfw234sdfasdf"
         company  : "Denny's"
         meal     : "Steak Dinner"
         distance : "1 mile away"
         price    : 25.00
         discount : 0.05
         image    : "http://3.bp.blogspot.com/-GRFptl3IVno/Uv-_xHwAdvI/AAAAAAAANRk/JQX9brfnlnM/s1600/DSC_1863.JPG"
      ]
