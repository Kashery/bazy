#!/bin/bash
echo "saving to `dirname $0`"/../../db-backups/full-backup.sql
docker exec infostrateg-central-db-1 pg_dump \
 -U inwebit infostrateg \
 > "`dirname $0`"/../../db-backups/full-backup.sql
echo "done"