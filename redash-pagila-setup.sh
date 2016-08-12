#!/bin/bash
set -e

# Install dependencies
sudo apt-get update
sudo apt-get install -y unzip

# Download and extract Pagila Database Files
cd /tmp
curl -O https://ftp.postgresql.org/pub/projects/pgFoundry/dbsamples/pagila/pagila/pagila-0.10.1.zip
unzip pagila-0.10.1.zip

# Import Pagila Database
cd pagila-0.10.1
sudo -u postgres createdb pagila
sudo -u postgres psql pagila < pagila-schema.sql
sudo -u postgres psql pagila < pagila-data.sql

# Create pagila user
sudo -u postgres psql -c "CREATE ROLE pagila WITH PASSWORD 'pagila' NOCREATEROLE NOCREATEDB NOSUPERUSER LOGIN;"
sudo -u postgres psql pagila -c "GRANT ALL ON ALL TABLES IN SCHEMA public TO pagila;"
sudo -u postgres psql pagila -c "GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO pagila;"
sudo -u postgres psql pagila -c "GRANT ALL ON ALL FUNCTIONS IN SCHEMA public TO pagila;"

# Create pagila datasource
cd /vagrant
bin/run python manage.py ds new --options '{"port": 5432, "host": "127.0.0.1", "password": "pagila", "user": "pagila", "dbname": "pagila"}' --type pg pagila
