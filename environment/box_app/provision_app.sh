sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update -y
sudo apt-get install ruby2.4 ruby2.4-dev -y
sudo apt-get install build-essential zlib1g-dev libgmp-dev libxml2 -y

sudo gem install bundler
sudo gem install rake
sudo gem install rails

sudo apt-get -y install postgresql postgresql-contrib libpq-dev

sudo chmod +x /home/ubuntu/app
sudo service nginx restart
