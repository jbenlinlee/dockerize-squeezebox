#!/bin/bash

PERL5LIB=/usr/share/squeezeboxserver/CPAN

SBDIR_HOME=/usr/libexec
SBDIR_LOG=/var/log/squeezeboxserver
SBDIR_PREFS=/var/lib/squeezeboxserver/prefs
SBDIR_CACHE=/var/lib/squeezeboxserver/cache

SB_CHARSET="utf8"
SB_USER="squeezeboxserver"

$SBDIR_HOME/squeezeboxserver --charset="$SB_CHARSET" --user="$SB_USER" --prefsdir="$SBDIR_PREFS" --logdir="$SBDIR_LOG" --cachedir="$SBDIR_CACHE"
