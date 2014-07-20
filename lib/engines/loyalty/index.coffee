module.exports = (count, cb)->
   if count is 0
      cb 1
   else if count < 3
      cb 0.5
   else if count % 5 is 0
      cb 1
   else
      cb 0
