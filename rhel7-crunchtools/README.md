Software Collection httpd24 Dockerfile
======================================

Build
-----

Building this Dockerfile requires a Red Hat Enterprise Linux 7 host
system with Software Collections entitlements available.
```
docker build -t rhel7-crunchtools .
```

Run
---
```
docker run -t -i rhel7-crunchtools /bin/bash
```
