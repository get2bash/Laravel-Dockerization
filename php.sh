

sudo apt install ca-certificates apt-transport-https software-properties-common

sudo add-apt-repository ppa:ondrej/php

sudo grep -rhE ^deb /etc/apt/sources.list* | grep -i ondrej

sudo apt update

sudo apt install php8.1 -y

php -v