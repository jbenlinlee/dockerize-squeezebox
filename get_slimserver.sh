#!/bin/bash

SSNIGHTLY_DIR="http://downloads.slimdevices.com/nightly"
SSNIGHTLY_FN=`curl -s $SSNIGHTLY_DIR/?ver=7.9 | grep '\.noarch\.rpm' | sed -E 's/.+href=\"\.\///' | sed -E 's/\">.+//'`
SSLOCAL_FN="slimserver.rpm"

echo "Fetching $SSNIGHTLY_FN from $SSNIGHTLY_DIR"
curl -o $SSLOCAL_FN $SSNIGHTLY_DIR/$SSNIGHTLY_FN
