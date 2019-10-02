#!/usr/bin/env bash
set -ex
set -o pipefail

generate(){
  laravel new first_laravel_site
}

dev(){
  php artisan serve
}

queryStr(){
  curl http://localhost:8000/?name=Goodwin
}

controller(){
  php artisan make:controller PagesController
}

"$@"
