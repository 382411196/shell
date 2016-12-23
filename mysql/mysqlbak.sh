#!/bin/bash
# Name:bakmysql.sh
# This is a ShellScript For Auto DB Backup and Delete old Backup
#
backupdir=/data/mysqlbak
time=` date +%Y%m%d%H `
mysqldump -u root --password=xxx -p coredata -R -E -e | gzip > $backupdir/coredata$time.sql.gz
#
find $backupdir -name "coredata*.sql.gz" -type f -mtime +5 -exec rm {} \; > /dev/null 2>&1
