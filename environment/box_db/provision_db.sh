sudo apt-get update
sudo apt-get -y install postgresql postgresql-contrib libpq-dev

# log in as the postgres user
# sudo -i -u postgres
cd app
sudo rm /etc/postgresql/9.5/main/postgresql.conf
sudo cp /home/ubuntu/app/environment/box_db/postgresql.conf /etc/postgresql/9.5/main/postgresql.conf


sudo rm /etc/postgresql/9.5/main/pg_hba.conf
sudo cp /home/ubuntu/app/environment/templates/pg_hba.conf /etc/postgresql/9.5/main/pg_hba.conf

sudo service postgresql restart


