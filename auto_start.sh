#add log dir for lnmp
if [ ! -d "/var/log/nginx" ]; then
  mkdir /var/log/nginx
fi

if [ ! -d "/var/log/mysql" ]; then
  mkdir /var/log/mysql
fi

if [ ! -d "/var/log/vsftpd" ]; then
  mkdir /var/log/vsftpd
fi


/etc/init.d/nginx restart
/etc/init.d/php-fpm start
/etc/init.d/mysql restart
/etc/init.d/vsftpd restart
