module.exports = (count)->
   if count is 0
      1
   else if count < 3
      0.5
   else if count % 5 is 0
      1
   else
      0
