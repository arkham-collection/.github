setup:
	git clone git@github.com:arkham-collection/frontend.git --recurse-submodule
	git clone git@github.com:arkham-collection/backend.git --recurse-submodule
	git clone git@github.com:arkham-collection/assets.git

start:
	docker-compose up -d

stop:
	docker-compose stop

restart:
	docker-compose restart

log:
	docker-compose logs -f $(service)

build:
	docker-compose build

shell:
	docker-compose exec $(service) sh

psql:
	docker-compose exec postgres sh -c "su - postgres -c 'psql $(db)'"

dropdb:
	docker-compose exec postgres sh -c "su - postgres -c 'dropdb $(db)'"

createdb:
	docker-compose exec postgres sh -c "su - postgres -c 'createdb $(db)'"

install:
	docker-compose run --rm --no-deps $(service) sh -ci 'npm install'

install_all:
	make install service=backend
	make install service=frontend
