# README

This README would normally document whatever steps are necessary to get the
application up and running.

Project details:

* Ruby version --> ruby-2.6.0

* Ruby version --> Rails 5.2.2

* Database creation --> rake db:create && rake db:seed && rake db:migrate

* Database initialization --> Mention mysql authentication with User and Password in database.yml file

* How to run the project
    -> git clone 
    -> bundle install
    -> rake db:create && rake db:seed && rake db:migrate
    -> rails server
    
* User.create!(email: "abc@gmail.com")

* Episode.create(title: "Episode",plot: "The Episode",season_id: 1) "season_id" should be Season object ID 
    
* http://localhost:3000/apipie will give the "api" lists

* Example: http://localhost:3000/api/v1/movies
