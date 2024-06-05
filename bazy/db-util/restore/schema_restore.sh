#!/bin/bash
echo "restoring from file `dirname $0`/../../db-backups/schema.sql"
if [ -f "`dirname $0`/../../db-backups/schema.sql" ]; then
    cat "`dirname $0`"/../../db-backups/schema.sql | \
    docker exec -i infostrateg-central-db-1 psql \
    -U inwebit infostrateg
else
    echo "File Not Found"
fi