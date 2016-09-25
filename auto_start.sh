#add log dir for lnmp
if [ ! -d "/var/log/nginx" ]; then
  mkdir /var/log/nginx
fi

if [ ! -d "/var/log/mysql" ]; then
  mkdir /var/log/mysql
fi

if [ ! -d "/var/log/nginx" ]; then
  mkdir /var/log/mysql
fi


/etc/init.d/nginx start
/etc/init.d/php-fpm start
/etc/init.d/mysql start
