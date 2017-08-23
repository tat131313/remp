#!/bin/bash

cd ${APP_NAME}

if [ ! -f ".env" ]
then
    cp .env.example .env
    composer install
    yarn install --no-bin-links
    yarn run dev
    if [ -f "artisan" ]
    then
        php artisan migrate
        php artisan db:seed
    elif [ -f "bin/command.php" ]
    then
        #php bin/command.php db:migrate
        php bin/command.php db:seed
    fi
fi
php-fpm

