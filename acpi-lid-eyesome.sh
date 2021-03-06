#!/bin/bash

# NAME: acpi-lid-eyesome.sh
# PATH: /etc/acpi
# DESC: Restart eyesome.sh when lid opened or closed.
# CALL: Automatically called by acpi when laptop lid is opened or closed.
# DATE: October 8, 2018. Modified October 22, 2018.

source eyesome-src.sh # Common code for eyesome___.sh bash scripts

log "Wait 3 seconds to see if suspending"

# sleep 3 may have to be increased for slower laptops
sleep 3 # If suspend via lid close pause for it to take effect

if [[ -f "$EyesomeIsSuspending" ]] ; then
    log "System supending, not waking eyesome"
    exit 0 # Don't want to reset brightness!
fi

if [[ -f "$EyesomeDbus" ]] ; then
    log "DBUS responding, not waking eyesome"
    exit 0 # Don't want to reset brightness!
fi

/usr/local/bin/wake-eyesome.sh post LidOpenClose spam

exit 0
