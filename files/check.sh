#!/bin/bash

IP=127.0.0.1 # check_ip
PORT=80 #check port
HTML_FILE=/var/www/html/index.html # page file name

nc -z -w2 "$IP" "$PORT"
PORT_STATUS=$?

if [[ -f $HTML_FILE && $PORT_STATUS -eq 0 ]]; then
    exit 0
else
    exit 1
fi
