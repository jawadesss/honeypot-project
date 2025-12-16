#!/bin/bash
# sql-h-log.sh

# Start log streaming in background and save its PID
stdbuf -oL docker logs -ft mysql_honeypot >> ./sql-h/log/mysql.log 2>&1 &
echo $! > /tmp/mysql_honeypot_log.pid
