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
&& /bin/echo "Done"

/bin/echo "Adding maintenance page"
sudo php bin/magento maintenance:enable --ip=104.236.96.121 --ip=195.14.124.5 \
&& /bin/echo "Done"

/bin/echo "Chown documentroot"
sudo chown -R apache:apache /var/www/html/ \
&& /bin/echo "Done"
