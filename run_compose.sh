#!/bin/bash

echo "1 - compose up"
echo "2 - compose down"
read x

if [ "$x" -eq 1 ]; then
    docker compose up --build -d
    ./sql-h-log.sh 
elif [ "$x" -eq 2 ]; then
    docker compose down
    # Kill the log streaming process
    if [ -f /tmp/mysql_honeypot_log.pid ]; then
        kill $(cat /tmp/mysql_honeypot_log.pid) 2>/dev/null
        rm /tmp/mysql_honeypot_log.pid
    fi
else
    echo "Invalid option"
fi
