#!/bin/bash
echo "saving to `dirname $0`"/../../db-backups/inserts.sql
docker exec infostrateg-central-db-1 pg_dump \
 --column-inserts \
 --data-only \
 -U inwebit infostrateg \
 > "`dirname $0`"/../../db-backups/inserts.sql
echo "done"