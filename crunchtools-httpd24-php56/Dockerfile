FROM rhel7-crunchtools
MAINTAINER docker@softwarecollections.org  
RUN yum update -y && yum clean all
RUN yum install yum-utils -y && yum clean all
RUN yum-config-manager --enable rhel-server-rhscl-7-rpms
RUN yum-config-manager --enable rhel-7-server-optional-rpms
RUN yum install -y --setopt=tsflags=nodocs httpd24 rh-php56 rh-php56-php-fpm && yum clean all

EXPOSE 80
EXPOSE 443

ADD ./enablehttpd24.sh /etc/profile.d/
ADD ./enablerh-php56.sh /etc/profile.d/
ADD ./php.conf /opt/rh/httpd24/root/etc/httpd/conf.d/
ADD ./info.php /opt/rh/httpd24/root/var/www/html/
ADD ./cmd.sh /

CMD ["/cmd.sh"]
