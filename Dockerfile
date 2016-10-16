FROM fedora:24
MAINTAINER John B. Lee <j.benlin.lee@gmail.com>
RUN dnf -v -y install perl && dnf -v -y clean all
ADD ./install_slimserver.sh /tmp
RUN /bin/bash /tmp/install_slimserver.sh
