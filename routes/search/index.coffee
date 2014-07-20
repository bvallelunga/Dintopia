module.exports.index = (req, res, next)->
   res.render "search/index",
      title: req.param("q") or ""
      search: req.param("q") or ""
      config: search : req.param("q") or ""
      js: req.coffee.renderTags "search"
      css: req.less.renderTags "search"
      coupons: [
         pub_id   : "adsfasdfasdf"
         company  : "Custom Burgers"
         meal     : "Big Ass Burger"
         distance : "1 mile away"
         price    : 25.00
         discount : 0.05
         image    : "http://www.foodandwine.com/images/sys/201010-best-burger-custom-house-tavern-ss.jpg",
         coord    :
            lat   : 37.778916
            lng   : -122.41055030000001
      ,
         pub_id   : "adfw234sdfasdf"
         company  : "Denny's"
         meal     : "Steak Dinner"
         distance : "1 mile away"
         price    : 25.00
         discount : 0.05
         image    : "http://3.bp.blogspot.com/-GRFptl3IVno/Uv-_xHwAdvI/AAAAAAAANRk/JQX9brfnlnM/s1600/DSC_1863.JPG",
         coord    :
            lat   : 37.7843083
            lng   : -122.4050638
      ]
