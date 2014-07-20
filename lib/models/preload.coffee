module.exports = (models)->

   models.companies.clear ->
      models.companies.create [
         id: 1
         name: 'Custom Burger'
         address: '121 7th St'
         city: 'San Fransisco'
         state: 'CA',
         zip: "94103"
         latitude: 37.778916
         longitude: -122.41055030000001
      ,
         id: 2
         name: "Deny's"
         address: '816 Mission St'
         city: 'San Fransisco'
         state: 'CA',
         zip: "94103"
         latitude: 37.7843083
         longitude: -122.4050638
      ,
         id: 3
         name: "SO"
         address: '1010 Bryant St'
         city: 'San Fransisco'
         state: 'CA',
         zip: "94103"
         latitude: 37.772413
         longitude: -122.407498
      ,
         id: 4
         name: "Chipotle"
         address: '865 Market St'
         city: 'San Fransisco'
         state: 'CA',
         zip: "94103"
         latitude: 37.783951
         longitude: -122.407162
      ,
         id: 5
         name: "Alexander's Steakhouse"
         address: '448 Brannan St'
         city: 'San Fransisco'
         state: 'CA',
         zip: "94103"
         latitude: 37.779257
         longitude: -122.395634
      ], lib.error.capture true

   models.coupons.clear ->
      models.coupons.create [
         id: 1
         name: "Make Any Burger"
         price: 20,
         image: "http://goo.gl/jiQ2SY"
         company_id: 1
      ,
         id: 2
         name: "Make Any Burger & Shake"
         price: 28,
         image: "http://goo.gl/WZKrTz",
         company_id: 1
      ,
         id: 3
         name: "Steak Night!"
         price: 32,
         image: "http://goo.gl/rmVNOk",
         company_id: 2
      ,
         id: 4
         name: "Orange Chicken Frenzy"
         price: 18,
         image: "http://goo.gl/0s7zVn",
         company_id: 3
      ,
         id: 5
         name: "Taco Shrimp Night!"
         price: 24,
         image: "http://goo.gl/AM86FY",
         company_id: 4
      ,
         id: 6
         name: "Dry Aged Steak"
         price: 156,
         image: "http://goo.gl/pBbTza",
         company_id: 5
      ,
         id: 7
         name: "House Shrimp"
         price: 210,
         image: "http://goo.gl/L8KUBz",
         company_id: 5
      ], lib.error.capture true

   models.users.clear -> lib.error.capture true

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
