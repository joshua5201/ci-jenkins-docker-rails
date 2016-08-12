#!/bin/bash
set -e

/etc/init.d/postgresql start

exec "$@"

