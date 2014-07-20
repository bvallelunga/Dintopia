module.exports = (cached)->
   if cached and moment().subtract(1, 'day') < cached.timestamp
      cached.score
   else
      if math.random < 0.2 then 1 else 0
