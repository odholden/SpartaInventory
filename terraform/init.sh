#!/bin/bash 

export DATABASE_NAME=spartaInventoryDb
export HOST_URL='inventory-db-id.cqito2bn96lf.eu-west-2.rds.amazonaws.com'
export DATABASE_USER=inventory
export APP_DATABASE_PASSWORD='${password}'
export RAILS_ENV=test 

cd /home/ubuntu/app
rake db:reset
rake db:migrate
rails s

