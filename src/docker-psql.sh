#!/bin/sh

exec sh -x -c "PGPASSWORD=$DB_PASSWORD $(whereis -b psql | tr -s '[:blank:]' '\n' | grep -v 'psql:\|/usr/local/bin/psql' | head -1) -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME"