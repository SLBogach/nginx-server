#!/bin/sh/

if grep -q "autoindex on" /etc/nginx/sites-available/my_domain
then sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/my_domain
echo "Autoindex off!"
nginx -s reload
elif grep -q "autoindex off" /etc/nginx/sites-available/my_domain
then sed -i 's/ off/autoindex on/' /etc/nginx/sites-available/my_domain
echo "Autoautoindexindex on!"
nginx -s reload
fi
