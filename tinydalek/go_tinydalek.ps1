# install PHP

choco install php -y

# install composer

choco install composer -y

& $env:tmp\Composer-Setup.exe 

# install the laraval bits

composer global require "laravel/installer"