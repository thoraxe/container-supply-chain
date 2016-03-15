FROM rhel7
MAINTAINER fatherlinux <scott.mccarty@gmail.com>

RUN yum install -y --setopt=tsflags=nodocs --disablerepo="*" --enablerepo="rhel-7-server-rpms" yum-utils deltarpm && \
    yum-config-manager --disable "*" && \
    yum-config-manager --enable rhel-7-server-rpms && \
    yum update -y --setopt=tsflags=nodocs && \
    yum clean all

# Avoid updating software supplied by base image unless necessary.
# https://github.com/projectatomic/container-best-practices/blob/master/creating/creating_index.adoc#updating-software-supplied-by-base-image

COPY ./motd /etc/motd
RUN echo "cat /etc/motd" >> /etc/bashrc
