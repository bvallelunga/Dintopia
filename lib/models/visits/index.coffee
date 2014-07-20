module.exports = (db, models)->
   db.define 'visits',
      discount:
         type: 'number'
         required: true
   ,
      timestamp: true
