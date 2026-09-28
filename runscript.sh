#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if command -v psql >/dev/null 2>&1; then
	PSQL="$(command -v psql)"
elif [[ -x "/c/Program Files/PostgreSQL/18/bin/psql.exe" ]]; then
	PSQL="/c/Program Files/PostgreSQL/18/bin/psql.exe"
else
	echo "psql was not found. Install PostgreSQL client tools or add psql to PATH." >&2
	exit 1
fi

"$PSQL" -h localhost -U postgres -d postgres -f "$SCRIPT_DIR/install.sql"