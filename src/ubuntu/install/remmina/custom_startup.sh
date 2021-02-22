#!/usr/bin/env bash
set -ex
FORCE=$1

if ( [ -z "$DISABLE_CUSTOM_STARTUP" ] ||  [ -n "$FORCE" ] ) ; then
    if [ -f /tmp/custom_startup.lck ] ; then
        echo "custom_startup already running!"
        exit 1
    fi
    touch /tmp/custom_startup.lck
    while true
    do
        if ! pgrep -x remmina > /dev/null
        then
            cd $HOME
            /usr/bin/desktop_ready
            remmmina
        fi
        sleep 1
    done
    rm /tmp/custom_startup.lck
fi