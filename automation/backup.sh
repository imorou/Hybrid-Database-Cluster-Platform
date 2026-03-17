#!/bin/bash

DATE=$(date +%Y%m%d)

echo "Starting Enterprise schema backup..."

docker exec oracle-db expdp \
enterprise/enterprise123@XEPDB1 \
SCHEMAS=ENTERPRISE \
DUMPFILE=enterprise_backup_$DATE.dmp \
LOGFILE=enterprise_backup_$DATE.log

echo "Backup completed"
