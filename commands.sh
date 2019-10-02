#!/usr/bin/env bash
set -ex
set -o pipefail

generate() {
  laravel new first_laravel_site
}

mig() {
  php artisan migrate
}

dev() {
  mig
  php artisan serve
}

queryStr() {
  curl http://localhost:8000/?name=Goodwin
}

controller() {
  php artisan make:controller PagesController
}

compFile=docker-compose.yml

post() {
  docker-compose -f $compFile build
  docker-compose -f $compFile up
}

repost() {
  set +e
  for c in eloquent_php_postgres; do
    docker kill $c
    docker rm $c
  done
  set -e
  post
}

"$@"
