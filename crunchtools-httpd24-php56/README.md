Middleware Core Build
======================================

Preparation
-----------
Make sure dockerifles are installed locally on the build system

yum install rhscl-dockerfiles.noarch
cp /usr/share/rhscl-dockerfiles/rhel7/rh-php56/enablerh-php56.sh ./
cp /usr/share/rhscl-dockerfiles/rhel7/httpd24/enablehttpd24.sh ./

Build
-----

Building this Dockerfile requires a Red Hat Enterprise Linux 7 host
system with Software Collections entitlements available.

docker build -t crunchtools-http24-php56 .

Run
---

docker run -d -p 80:80 -p 443:443 crunchtools-http24-php56

Test
----
curl localhost/info.php
