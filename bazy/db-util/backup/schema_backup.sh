#!/bin/bash
echo "saving to `dirname $0`"/../../db-backups/schema.sql
docker exec infostrateg-central-db-1 pg_dump \
 --schema-only \
 -U inwebit infostrateg \
 >  "`dirname $0`"/../../db-backups/schema.sql
echo "done"