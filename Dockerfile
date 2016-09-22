FROM centos:7
MAINTAINER myzero1 <myzero1@sina.com>

# Replace the software sources
RUN yum install -y wget
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum makecache

#install ifconfig
RUN yum install -y net-tools.x86_64

# Lnmp Initialization and Startup Script
ADD ./myzero1_edit_lnmp.sh /myzero1_edit_lnmp.sh
RUN chmod 755 /myzero1_edit_lnmp.sh
RUN bash myzero1_edit_lnmp.sh

RUN mkdir /source
RUN cd /source
RUN yum install -y zip
RUN wget http://dlsw.baidu.com/sw-search-sp/soft/26/14218/phpMyAdmin_4.4.11_all_languages.1437381213.zip
RUN unzip phpMyAdmin_4.4.11_all_languages.1437381213.zip
RUN cp -rf phpMyAdmin-4.4.11-all-languages /home/wwwroot/default/phpmyadmin
RUN cd /home/wwwroot/default/phpmyadmin
RUN cp config.sample.inc.php config.inc.php 




