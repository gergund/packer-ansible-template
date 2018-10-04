#!/bin/bash
/bin/echo "Creating documentroot and installing Magento"
sudo mkdir -p /var/www/html && cd /var/www/html/ && sudo git clone https://github.com/magento/magento2.git . \
&& /bin/echo "Done"

/bin/echo "Installing composer"
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& /bin/echo "Done"

/bin/echo "Running composer install"
/usr/local/bin/composer install \
    && chmod u+x bin/magento \
    && chown -R www-data:www-data .
&& /bin/echo "Done"
