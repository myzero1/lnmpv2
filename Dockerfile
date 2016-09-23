FROM centos:7
MAINTAINER myzero1 <myzero1@sina.com>

#disable fastestmirror
RUN sed -i "s|enabled=1|enabled=0|g" /etc/yum/pluginconf.d/fastestmirror.conf
RUN sed -i "s|plugins=1|plugins=0|g" /etc/yum.conf

# Replace the software sources
RUN yum install -y wget
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum clean all
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
