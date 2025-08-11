#!/bin/sh

exec sh -x -c "MYSQL_PWD=$DB_PASSWORD $(whereis -b mysql | tr -s '[:blank:]' '\n' | grep -v 'mysql:\|/usr/local/bin/mysql' | head -1) -h$DB_HOST -P$DB_PORT -u$DB_USER $DB_NAME"