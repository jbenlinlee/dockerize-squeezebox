FROM fedora:24
MAINTAINER John B. Lee <j.benlin.lee@gmail.com>
ADD ./install_slimserver.sh ./start_slimserver.sh /
RUN /install_slimserver.sh
USER squeezeboxserver
ENTRYPOINT /start_slimserver.sh
