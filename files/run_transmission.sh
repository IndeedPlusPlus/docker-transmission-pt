#!/bin/bash

set -e

CONFIG_DIR=/etc/transmission-daemon
SETTINGS=$CONFIG_DIR/settings.json
TRANSMISSION=/usr/bin/transmission-daemon

unset TRANSMISION_ADMIN_PASS

exec $TRANSMISSION -f --no-portmap $EXTRA_FLAGS --config-dir $CONFIG_DIR 


