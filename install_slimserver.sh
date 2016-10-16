#!/bin/bash

SSLOCAL_FN="/tmp/slimserver.rpm"
SSNIGHTLY_DIR="http://downloads.slimdevices.com/nightly"
SSNIGHTLY_FN=`curl -s $SSNIGHTLY_DIR/?ver=7.9 | grep '\.noarch\.rpm' | sed -E 's/.+href=\"\.\///' | sed -E 's/\">.+//'`

echo "Installing required system tools"
dnf -v -y install glibc-langpack-en

echo "Installing required PERL Modules"
dnf -v -y install perl
dnf -v -y install perl-Getopt-Long
dnf -v -y install perl-Time-HiRes
dnf -v -y install perl-Storable
dnf -v -y install perl-Digest-MD5

echo "Fetching $SSNIGHTLY_FN from $SSNIGHTLY_DIR"
curl -o $SSLOCAL_FN $SSNIGHTLY_DIR/$SSNIGHTLY_FN

echo "Installing SlimServer"
rpm -i -vv -p $SSLOCAL_FN

echo "Cleaning up"
rm -v $SSLOCAL_FN
dnf -v -y clean all
