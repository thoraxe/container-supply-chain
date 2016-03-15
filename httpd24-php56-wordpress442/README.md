Wordpress Build
======================================

Build
-----

Building this Dockerfile requires a Red Hat Enterprise Linux 7 host
system with Software Collections entitlements available.
```
docker build -t http24-php56-wordpress442 .
```

Run
---

Setup test database
```
docker run -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password -it docker.io/mysql
```

Notice that it uses all of the exact same variables as the "Official" wordpress image. This means that this image can be used in Kubernetes and OpenShift demos which pull the Wordpress official image.
```
docker run -d -p 80:80 -p 443:443 -e WORDPRESS_DB_HOST=192.168.128.112:3306 -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=password -it http24-php56-wordpress442
```

Test
----
Test Wordpress or the underlying php/webserver
```
curl localhost/index.php
curl localhost/info.php
```
