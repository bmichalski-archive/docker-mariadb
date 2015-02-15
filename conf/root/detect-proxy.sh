#!/bin/bash

PROXY=dockerhost

nc -z $PROXY 3142

if [ $? -eq 0 ]; then
    PROXY=http://$PROXY:3142
    # \x0d is used to clear the line
    printf '\x0d%s\n' "Using $PROXY as proxy." >&2
    echo "$PROXY"
    exit
fi

print_msg "No proxy will be used"

