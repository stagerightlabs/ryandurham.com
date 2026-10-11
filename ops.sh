#!/usr/bin/env bash

# Heavily borrowed from Cris Fidao and the "Shipping Docker" course
# https://serversforhackers.com/shipping-docker

COMPOSE="docker compose"

# If we pass any arguments...
if [ $# -gt 0 ];then

    # Run the artisan console
    if [ "$1" == "art" ]; then
        shift 1
        $COMPOSE exec \
            app \
            php artisan "$@"

    # Run the artisan console
    elif [ "$1" == "artisan" ]; then
        shift 1
        $COMPOSE exec \
            app \
            php artisan "$@"

    # Run Composer
    elif [ "$1" == "composer" ]; then
        shift 1
        $COMPOSE exec \
            app \
            composer "$@"

    # Run PNPM
    elif [ "$1" == "pnpm" ]; then
        shift 1
        $COMPOSE run --rm \
            node \
            pnpm "$@"

    # Run NPX
    elif [ "$1" == "npx" ]; then
        shift 1
        $COMPOSE run --rm \
            node \
            npx "$@"

    # Run Pest
    elif [ "$1" == "test" ]; then
        shift 1
        $COMPOSE exec \
            app \
            ./vendor/bin/pest "$@" --compact

    # Run Pint
    elif [ "$1" == "format" ]; then
        shift 1
        $COMPOSE exec \
            app \
            vendor/bin/pint "$@" --parallel --dirty

    # Run PHPStan
    elif [ "$1" == "phpstan" ]; then
        shift 1
        $COMPOSE exec \
            app \
            ./vendor/bin/phpstan "$@"

    # Else, pass through to docker compose
    else
        $COMPOSE "$@"
    fi

else
    $COMPOSE ps
fi
