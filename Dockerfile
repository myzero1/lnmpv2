FROM centos:7
MAINTAINER myzero1 <myzero1@sina.com>

# Replace the software sources
RUN yum install -y wget
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum makecache

#install ifconfig
RUN yum install -y net-tools.x86_64




