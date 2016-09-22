mkdir /source
cd /source
yum install -y zip
wget http://dlsw.baidu.com/sw-search-sp/soft/26/14218/phpMyAdmin_4.4.11_all_languages.1437381213.zip
unzip phpMyAdmin_4.4.11_all_languages.1437381213.zip
cp -rf phpMyAdmin-4.4.11-all-languages /home/wwwroot/default/phpmyadmin
cd /home/wwwroot/default/phpmyadmin
cp config.sample.inc.php config.inc.php 
