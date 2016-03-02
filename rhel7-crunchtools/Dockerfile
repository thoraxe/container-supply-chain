FROM rhel7
MAINTAINER fatherlinux <scott.mccarty@gmail.com>
RUN yum install -y --disablerepo="*" --enablerepo="rhel-7-server-rpms" yum-utils deltarpm && yum clean all
RUN yum-config-manager --disable "*" &>/dev/null
RUN yum-config-manager --enable rhel-7-server-rpms
RUN yum update -y && yum clean all

COPY ./motd /etc/motd
RUN echo "cat /etc/motd" >> /etc/bashrc
