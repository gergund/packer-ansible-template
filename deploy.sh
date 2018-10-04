#!/bin/bash
/bin/echo "Creating documentroot and installing Magento"
sudo mkdir -p /var/www/html && cd /var/www/html/ && sudo git clone https://github.com/magento/magento2.git . \
&& /bin/echo "Done"

/bin/echo "Installing composer"
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer \
&& /bin/echo "Done"

/bin/echo "Running composer install"
sudo /usr/local/bin/composer install \
    && sudo chmod +x bin/magento \
    && sudo chown -R apache:apache . \
&& /bin/echo "Done"
