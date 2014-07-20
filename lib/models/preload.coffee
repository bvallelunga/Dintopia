module.exports = (models)->

   models.companies.clear ->
      models.companies.create [
         id: 1
         name: 'Custom Burger'
         address: 'On 7th'
         city: 'SF'
         latitude: 30
         longitude: -100
      ], lib.error.capture true

   models.users.clear ->
      models.users.create [
         id: 1
         name: 'Sam'
      ,
         id: 2
         name: 'Brian'
      ,
         id: 3
         name: 'Kib'
      ], lib.error.capture true

   models.visits.clear ->
      models.visits.create [
         id: 1
         user_id: 1
         company_id: 1
         discount: 0.1
      ,
         id: 2
         user_id: 1
         company_id: 1
         discount: 0.1
      ,
         id: 3
         user_id: 1
         company_id: 1
         discount: 0.1
      ,
         id: 4
         user_id: 1
         company_id: 1
         discount: 0.1
      ,
         id: 5
         user_id: 2
         company_id: 1
         discount: 0.1
      ], lib.error.capture true
