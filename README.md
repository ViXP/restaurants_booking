# README

Restaurant tables booking project (1 hour of continuous coding).

## TODO:
* Write all Controllers with all needed actions (format HTML and JSON) :
  1. *Restaurants* - refactor a bit of all CRUD actions
  2. *Reservation* - finish the reservation_params method, create method,
                     implement destroy method
  3. *DiningTables* - implement new, create, edit, update, destroy actions
  4. *DaySchedules* - implement edit, update actions

* Finish the coding of the draft version of HTML views in HAML templates

* Code the JSON templates for all required actions (using JBuilder)

* Install & configure RSpec, FactoryBot and write a lot of unit tests to test if
  the models validations and destroy dependencies are working correctly for all
  the models (intersections, time availability etc.) with help of factories.

* Install Carrierwave, with Fog (for AWS S3 on CloudFront CDN using), configure,
  write uploaders for user images (restaurant logo and etc.)

* Implement user roles (restaurant owner, visitor), secure the private data and 
  actions with before callbacks, using cookies sessions, implement the 
  authorization mechanism for restaurant owners (maybe with help of Devise GEM).

* Install Redis and Sidekiq, for mailer, user cleaning, old reservations 
  cleaning jobs. Implement the mailing jobs for registering confirmation (each
  mail job must be independent from the main rails app, so ActiveJobs must be
  serialized in Redis and controlled be the separate queuing manager - Sidekiq).
  Implement user and reservations cleaning jobs (some of them may be implemented
  independently from whole application - using bash-scripts and cron).

* Install webpacker, separate the frontend from backend, using Rails as SPA
  (JSON API, React-driven frontend with Redux store).

* Further logics implementation...

* Install & configure Cucumber & Capybara, write the requests functional tests
  (RSpec with FactoryBot) and several integration tests (Cucumber & Capybara)

* Implement deployment scripts with Capistrano, provise the servers software
  (with Chef recepies) on AWS, work on the AWS virtual network infrastructure.

* Install Memcached, implement fragment and model caching for smaller DB load.
