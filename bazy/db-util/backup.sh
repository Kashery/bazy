#!/bin/bash
echo "attempting full database backup"
sh "`dirname $0`"/backup/full_backup.sh
echo "attempting database inserts backup"
sh "`dirname $0`"/backup/insert_backup.sh
echo "attempting database schema backup"
sh "`dirname $0`"/backup/schema_backup.sh