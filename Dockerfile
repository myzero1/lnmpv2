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

RUN echo "/etc/init.d/nginx start" >> /etc/bash.bashrc
RUN echo "/etc/init.d/php-fpm start" >> /etc/bash.bashrc
RUN echo "/etc/init.d/mysql start" >> /etc/bash.bashrc

# Lnmp Initialization and Startup Script
#ADD ./install_phpmyadmin.sh /install_phpmyadmin.sh
#RUN chmod 755 /install_phpmyadmin.sh
#RUN bash install_phpmyadmin.sh





