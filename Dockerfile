FROM centos:7
MAINTAINER myzero1 <myzero1@sina.com>

# Replace the software sources
RUN yum install -y wget
RUN cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum makecache

#install ifconfig
RUN yum install -y net-tools.x86_64

# Lnmp Initialization and Startup Script
ADD ./myzero1_edit_lnmp.sh /myzero1_edit_lnmp.sh
RUN chmod 755 /myzero1_edit_lnmp.sh
RUN bash myzero1_edit_lnmp.sh


# auto_start
ADD ./auto_start.sh /auto_start.sh
RUN chmod 755 /auto_start.sh
RUN echo "bash /auto_start.sh" >> /etc/bashrc
