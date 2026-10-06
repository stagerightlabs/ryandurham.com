.PHONY: up down build shell artisan composer npm test
up:
	docker compose up -d
down:
	docker compose down
build:
	docker compose build
shell:
	docker compose exec app sh
artisan:
	docker compose exec app php artisan $(filter-out $@,$(MAKECMDGOALS))
composer:
	docker compose exec app composer $(filter-out $@,$(MAKECMDGOALS))
npm:
	docker compose exec node npm $(filter-out $@,$(MAKECMDGOALS))
test:
	docker compose exec app php artisan test
%:
	@:
