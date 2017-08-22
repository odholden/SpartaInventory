sudo apt-get update
sudo apt-get -y install postgresql postgresql-contrib libpq-dev

# log in as the postgres user
# sudo -i -u postgres
cd app
sudo rm /etc/postgresql/9.5/main/postgresql.conf
sudo cp postgresql.conf /etc/postgresql/9.5/main/postgresql.conf
sudo service postgresql restart
