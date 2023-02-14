# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Install and run redis server using command in termainal #redis-server

* Run sidekiq in new termainal using command #sidekiq

* Run bundler using command #bundle

* Run rake db:create

* Run rake db:migrate

* Run rake db:seed to populate data in db

* Start server using rails s
* To get all disbursemnet hit URL: http://localhost:3000/api/v1/disbursements

* TO get disbursement of specfic merchant send merchant id and hit http://localhost:3000/api/v1/disbursements?merchant=<merchant_id> e.g merchant_id=1
it will bring all the merchant of current week

* To get disbursements of merchant within given date pass starting and ending date like http://localhost:3000/api/v1/disbursements?merchant=1&start_date=2023-02-01&end_date=2023-02-11

Technical choices:
* Use zenitwerk loader as it was the default loader in rails 7
* Made application to entertain api only
* Used rubocop to ensure code is writing according to standard
* Use sidekiq adapter to queue job and sidekiq-cron for backgound job
* Use faker to create faker data into db
* Use factories to get data from centerlized place
* Use rspec framework to write test cases
* Use shoulda matcher for wirting less code.

Suggestions:
* Can use token based authentication to access API's to only authrized users
* For bigger application that only deals with API's we can use Grape or Grpahql library which provide clean interfaces to interact and fulfil RESTful architect requirements

* Can use rubucop.yml file and set/update rules acccordingly