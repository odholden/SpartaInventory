sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update -y
sudo apt-get install ruby2.4 ruby2.4-dev -y
sudo apt-get install build-essential zlib1g-dev libgmp-dev libxml2 -y

sudo gem install bundler
sudo gem install rake
sudo gem install rails

sudo apt-get install -y dirmngr gnupg
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates
# Add our APT repository
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'
sudo apt-get update
# Install Passenger + Nginx
yes N | sudo apt-get install -y nginx-extras passenger

sudo rm /etc/nginx/sites-available/default
sudo cp ~/app/environment/templates/default /etc/nginx/sites-available/default
sudo cp ~/app/environment/templates/nginx.conf /etc/nginx/nginx.conf
chmod +x ~/app
sudo service nginx reload
