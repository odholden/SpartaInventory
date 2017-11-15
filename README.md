# README

## Installation Instructions for Development Environment

* Install VirtualBox, Vagrant and Chef
* Run vagrant up to create VM for development
* Start vagrant ssh app 
* cd into app/
* Run bundle install and rails install
* Start rails server
* Within the internet browser type http://development.local:3000/
* test username: test@spartaglobal.com
* password: test123

## Testing instructions

This app uses the following for testing: 

* Rspec for tests and assertions
* FactoryGirl for mocking database models
* Faker for creating test data

The testing command is `bundle exec rspec`. You will need to ensure `bundle install` has been run previously to install the above gems for testing.

## The Task

As a team of 4 developers we were given the task of adding features and fixing bugs for a web application that is currently in use by staff at Sparta Global. 

## The Brief

### Sprint 1 
1. Validation - Item cannot be added unless the description field is populated.
2. Fix error page when item is checked out.
3. Add two columns in the item index page for item lender and borrower.
4. Identify when item was overdue and send a notification if item is overdue.
5. Highlight due date on item index page.

### Sprint 2
1. 

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

THIS NEEDS MORE, SO MUCH MORE

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
