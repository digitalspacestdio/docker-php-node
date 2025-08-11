#!/bin/sh

# Find mysql binary
MYSQL_BIN=$(whereis -b mysql | tr -s '[:blank:]' '\n' | grep -v 'mysql:\|/usr/local/bin/mysql' | head -1)

# Build environment prefix
[ -n "$DB_PASSWORD" ] && ENV_PREFIX="MYSQL_PWD=$DB_PASSWORD"

# Build options
[ -n "$DB_HOST" ] && OPTS="$OPTS -h$DB_HOST"
[ -n "$DB_PORT" ] && OPTS="$OPTS -P$DB_PORT"
[ -n "$DB_USER" ] && OPTS="$OPTS -u$DB_USER"
[ -n "$DB_NAME" ] && OPTS="$OPTS $DB_NAME"

# Execute with debugging, passing all extra args
exec sh -x -c "$ENV_PREFIX $MYSQL_BIN $OPTS $*"
