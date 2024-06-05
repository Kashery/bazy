#!/bin/bash
echo "restoring from file `dirname $0`/../../db-backups/full-backup.sql"
if [ -f "`dirname $0`/../../db-backups/full-backup.sql" ]; then
    cat "`dirname $0`"/../../db-backups/full-backup.sql | \
    docker exec -i infostrateg-central-db-1 psql \
    -U inwebit infostrateg
else
    echo "File Not Found"
fi