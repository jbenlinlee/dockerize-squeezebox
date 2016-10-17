#!/bin/bash

SSNIGHTLY_DIR="http://downloads.slimdevices.com/nightly"
SSNIGHTLY_FN=`curl -s $SSNIGHTLY_DIR/?ver=7.9 | grep '\.noarch\.rpm' | sed -E 's/.+href=\"\.\///' | sed -E 's/\">.+//'`
SSLOCAL_FN=/tmp/slimserver.rpm

SSSHARE=/usr/share/squeezeboxserver

echo "Installing required system tools"
dnf -v -y install glibc-langpack-en

echo "Installing required PERL Modules"
dnf -v -y install perl
dnf -v -y install perl-Getopt-Long
dnf -v -y install perl-Time-HiRes
dnf -v -y install perl-Storable
dnf -v -y install perl-Digest-MD5
dnf -v -y install perl-Archive-Zip

echo "Installing SlimServer"
curl -o $SSLOCAL_FN $SSNIGHTLY_DIR/$SSNIGHTLY_FN
rpm -i -vv -p $SSLOCAL_FN

echo "Fixing permissions"
touch /var/log/squeezeboxserver/server.log
touch /var/log/squeezeboxserver/perfmon.log
chown -Rv squeezeboxserver:squeezeboxserver /var/log/squeezeboxserver
chown -Rv squeezeboxserver:squeezeboxserver /var/lib/squeezeboxserver
chown -v squeezeboxserver:squeezeboxserver /start_slimserver.sh

echo "Cleaning up"
rm -rf $SSSHARE/CPAN/arch/{5.8,5.10,5.12,5.14,5.16,5.18,5.20}
rm $SSLOCAL_FN
dnf -v -y clean all
