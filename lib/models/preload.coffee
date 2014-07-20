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
      ], lib.error.capture true
