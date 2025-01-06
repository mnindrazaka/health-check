#!/bin/bash

URL=$1
INTERVAL=$2


echo "Starting health check for $URL every $INTERVAL seconds..."

while true; do
    RESPONSE=$(curl -o /dev/null -s -w "%{http_code}" $URL)
    if [ "$RESPONSE" -eq 200 ]; then
        echo "$(date): $URL is up (Status: $RESPONSE)"
    else
        echo "$(date): $URL is down or unreachable (Status: $RESPONSE)"
    fi
    sleep $INTERVAL
done