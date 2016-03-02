FROM crunchtools-http24-php56
MAINTAINER fatherlinux <scott.mccarty@gmail.com>

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /etc/opt/rh/rh-php56/opcache-recommended.ini

VOLUME /opt/rh/httpd24/root/var/www/html

ENV WORDPRESS_VERSION 4.4.2
ENV WORDPRESS_SHA1 7444099fec298b599eb026e83227462bcdf312a6

# upstream tarballs include ./wordpress/ so this gives us /usr/src/wordpress
RUN yum install -y tar rh-php56-php-mysqlnd
RUN curl -o wordpress.tar.gz -SL https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz \
	&& echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c - \
	&& tar -xzf wordpress.tar.gz -C /usr/src/ \
	&& rm wordpress.tar.gz \
	&& chown -R apache:apache /usr/src/wordpress

COPY docker-entrypoint.sh /entrypoint.sh

# grr, ENTRYPOINT resets CMD now
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/cmd.sh"]
