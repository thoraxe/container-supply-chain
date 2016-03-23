FROM rhel7
MAINTAINER fatherlinux <scott.mccarty@gmail.com>

ENV COREBUILD_VERSION 7.2

COPY ./open.repo /etc/yum.repos.d/
COPY ./infra-rhel-7.2.repo /etc/yum.repos.d/
COPY ./infra-extras-7.2.repo /etc/yum.repos.d/
COPY ./openshift_additional.repo /etc/yum.repos.d/
COPY ./epel.repo /etc/yum.repos.d/

RUN yum install -y --setopt=tsflags=nodocs yum-utils deltarpm && \
    yum update -y --setopt=tsflags=nodocs && \
    yum install -y iputils net-tools nmap-ncat nmap && \
    yum install -y tar && \
    yum clean all

COPY ./motd /etc/motd
RUN echo "cat /etc/motd" >> /etc/bashrc && \
    useradd -u 1001 -r -g 0 -m -d /opt/app-root -s /sbin/nologin -c "Default Application User" default && \
    chown -R 1001:0 /opt/app-root
