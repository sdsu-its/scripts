#!/bin/bash
# Maintain MySQL DB
###############################################################################

MYSQLPASS="MyPassword"
BACKUPPATH="/srv/backups/dbs.sql"

mysqldump -u root -p$MYSQLPASS --all-databases --result-file=$BACKUPPATH
mysqlcheck -u root -p$MYSQLPASS --check --all-databases
mysqlcheck -u root -p$MYSQLPASS --optimize --all-databases
mysqlcheck -u root -p$MYSQLPASS --analyze --all-databases
