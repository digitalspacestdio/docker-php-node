#!/bin/sh

# Find psql binary
PSQL_BIN=$(whereis -b psql | tr -s '[:blank:]' '\n' | grep -v 'psql:\|/usr/local/bin/psql' | head -1)

# Build environment prefix
[ -n "$DB_PASSWORD" ] && ENV_PREFIX="PGPASSWORD=$DB_PASSWORD"

# Build options
[ -n "$DB_HOST" ] && OPTS="$OPTS -h $DB_HOST"
[ -n "$DB_PORT" ] && OPTS="$OPTS -p $DB_PORT"
[ -n "$DB_USER" ] && OPTS="$OPTS -U $DB_USER"
[ -n "$DB_NAME" ] && OPTS="$OPTS -d $DB_NAME"

# Execute with debugging, pass all extra args from $@
exec sh -x -c "$ENV_PREFIX $PSQL_BIN $OPTS $*"