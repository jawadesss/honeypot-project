#!/bin/bash

echo "1 - compose up"
echo "2 - compose down"
read x

if [ "$x" -eq 1 ]; then
    docker compose up --build -d
    ./sql-h-log.sh 
    ./run_promtail
elif [ "$x" -eq 2 ]; then
    docker compose down
    # Kill the log streaming process
    if [ -f /tmp/mysql_honeypot_log.pid ]; then
        kill $(cat /tmp/mysql_honeypot_log.pid) 2>/dev/null
        rm /tmp/mysql_honeypot_log.pid
    fi
    

   if [ -f /tmp/promtail.pid ]; then 
	kill $(cat /tmp/promtail.pid) 2>/dev/null
	rm /tmp/promtail.pid
   fi
else
    echo "Invalid option"
fi
