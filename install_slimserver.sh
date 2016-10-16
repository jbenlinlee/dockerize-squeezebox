#!/bin/bash

SSLOCAL_FN="/tmp/slimserver.rpm"
SSNIGHTLY_DIR="http://downloads.slimdevices.com/nightly"
SSNIGHTLY_FN=`curl -s $SSNIGHTLY_DIR/?ver=7.9 | grep '\.noarch\.rpm' | sed -E 's/.+href=\"\.\///' | sed -E 's/\">.+//'`

echo "Fetching $SSNIGHTLY_FN from $SSNIGHTLY_DIR"
curl -o $SSLOCAL_FN $SSNIGHTLY_DIR/$SSNIGHTLY_FN

echo "Installing SlimServer"
rpm -i -vv -p $SSLOCAL_FN

echo "Removing RPM file"
rm $SSLOCAL_FN
