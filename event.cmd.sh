#!/usr/bin/env bash

set -e

echo

if [[ $SERF_EVENT != 'user' ]]; then
    echo "ERROR: Bad \$SERF_EVENT: $SERF_EVENT"
    exit 1
fi

if [[ $SERF_USER_EVENT != 'cmd' ]]; then
    echo "ERROR: Bad \$SERF_USER_EVENT: $SERF_USER_EVENT"
    exit 1
fi

while read -r line; do
    echo "Running command: $line"
    exec $line
done
