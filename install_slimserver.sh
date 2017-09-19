#!/bin/bash

SSNIGHTLY_DIR="http://downloads.slimdevices.com/nightly"
SSNIGHTLY_FN=`curl -s $SSNIGHTLY_DIR/?ver=7.9 | grep '\.noarch\.rpm' | sed -E 's/.+href=\"\.\///' | sed -E 's/\">.+//'`
SSLOCAL_FN=/tmp/slimserver.rpm

SSSHARE=/usr/share/squeezeboxserver

echo "================================"
echo "Installing required system tools"
echo "================================"
dnf -v -y install libgomp
dnf -v -y install flac-libs
dnf -v -y install glibc-langpack-en

echo "================================"
echo "Installing required PERL Modules"
echo "================================"
dnf -v -y install perl
dnf -v -y install perl-Getopt-Long
dnf -v -y install perl-Time-HiRes
dnf -v -y install perl-Storable
dnf -v -y install perl-Digest-MD5
dnf -v -y install perl-Archive-Zip
dnf -v -y install perl-Font-FreeType
dnf -v -y install perl-Devel-Peek

echo "====================="
echo "Installing SlimServer"
echo "====================="
curl -o $SSLOCAL_FN $SSNIGHTLY_DIR/$SSNIGHTLY_FN
rpm -i -p $SSLOCAL_FN

echo "=================="
echo "Fixing permissions"
echo "=================="
touch /var/log/squeezeboxserver/server.log
touch /var/log/squeezeboxserver/perfmon.log
chown -Rv squeezeboxserver:squeezeboxserver /var/log/squeezeboxserver
chown -Rv squeezeboxserver:squeezeboxserver /var/lib/squeezeboxserver
chown -v squeezeboxserver:squeezeboxserver /start_slimserver.sh

echo "================"
echo "Setting Timezone"
echo "================"
rm /etc/localtime
ln -sv /usr/share/zoneinfo/US/Eastern /etc/localtime

echo "==========="
echo "Cleaning up"
echo "==========="
rm -rf $SSSHARE/CPAN/arch/{5.8,5.10,5.12,5.14,5.16,5.18,5.20}
rm $SSLOCAL_FN
dnf -v -y clean all
for locale in `localedef --list-archive | grep -v -i ^en`; do
  localedef --delete-from-archive $locale
done
mv -v /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive.tmpl
build-locale-archive
rm -v /usr/lib/locale/locale-archive.tmpl
