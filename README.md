# README

This is the Visit.org test application. This current version @ January 25, 2019. Created by Fábio Araújo - fabioaraujo121@gmail.com

## Desc:
There are 2 levels of users Admin and Ordinary, the Admin user can create Hotels.
Both of them can filter a list of hotels, with filters like: range of price per person, location (city, state, country), facilites, name.

## Versions:
* Ruby: 2.5.0
* Ruby on Rails: 5.2.2
* PostgreSQL: 9.5.12

# Deployment steps:
	Pay attention to your RAILS_ENV to match DB

## Setting up Rails
1. bundle install
2. rails db:create (rails db:create --trace)
3. rails db:migrate (rails db:migrate --trace)
4. rails db:seed (rails db:seed --trace)

### Admin User
* admin@visit-project.com
* 123456

### Ordinary User
* admin@visit-project.com
* 123456

### Heroku
It's up at Heroku, just click below and use the above credentials


[visit-project.herokuapp.com/](https://visit-project.herokuapp.com/)