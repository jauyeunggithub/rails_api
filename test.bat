@echo off

echo Building Docker containers...
docker-compose build

echo Running migrations...
docker-compose run app rails db:create
docker-compose run app rails db:migrate

echo Running tests...
docker-compose run app rspec

echo Done. Containers are built, migrations are applied, and tests have run.

