#!/bin/bash
cd /var/www/html/php-aws-codepipeline-example
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php composer.phar install
php artisan key:generate
php artisan make:auth
sudo chmod -R 777 /var/www/html/php-aws-codepipeline-example/storage