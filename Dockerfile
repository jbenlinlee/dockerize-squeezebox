FROM fedora:24
MAINTAINER John B. Lee <j.benlin.lee@gmail.com>
RUN dnf -v -y install perl && dnf -v -y clean all
