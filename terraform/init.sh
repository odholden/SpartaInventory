#!/bin/bash 
export DATABASE_NAME='${database_name}'
export HOST_URL='${endpoint}'
export DATABASE_USER='${username}'
export APP_DATABASE_PASSWORD='${password}'
export RAILS_ENV=test 

cd /home/ubuntu/app
rake db:reset
rake db:migrate
rails s

