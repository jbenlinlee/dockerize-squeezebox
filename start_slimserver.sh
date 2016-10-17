#!/bin/bash

export PERL5LIB=/usr/share/squeezeboxserver/CPAN:/usr/lib/perl5/vendor_perl

SBDIR_HOME=/usr/libexec
SBDIR_LOG=/var/log/squeezeboxserver
SBDIR_PREFS=/squeezebox/prefs
SBDIR_CACHE=/var/lib/squeezeboxserver/cache

SB_CHARSET="utf8"
SB_USER="squeezeboxserver"

chown -R squeezeboxserver:squeezeboxserver /squeezebox/playlists
chown -R squeezeboxserver:squeezeboxserver /squeezebox/prefs
$SBDIR_HOME/squeezeboxserver --charset "$SB_CHARSET" --user "$SB_USER" --prefsdir "$SBDIR_PREFS" --logdir "$SBDIR_LOG" --cachedir "$SBDIR_CACHE"
