#!/bin/bash

echo "Starting Ruby on Rails app on port ${port}"
cd /home/ubuntu/app
export RAILS_ENV=${environment}
export DATABASE_URL='${database_url}'
rake assets:precompile
rails s -d --port=${port} --binding=0.0.0.0