Supply Chain Demo
======================================

Directories
-----------

rhel7-crunchtools: Corebuild which does initial yum installs and updates from upstream Red Hat Engineering. This core build would typically be execute by the operations team and saved in an enterprise registry locally within a company.

crunchtools-httpd24-php56: Middleware layer, built upon rhel7-crunchtools core build, which installs and configures Apache 2.4 and PHP 5.6 from the Red Hat Software Collections. This set of software is built to work together using the modern FPM/FastCGI technology and Apache's MPM event driven main loop.

wordpress42: Middleware layer, built upong crunchtools-httpd24-php56, which installs wordpress using a similar methodology as the Official image on DockerHub. The advantage of this build is it constructed on a completely trusted software supply chain.
