#!/bin/bash
set -e

# memcached
/usr/bin/memcached &

# redis
redis-server /etc/redis/redis.conf

# sphinx

# go
/docker/dev-go

exec "$@"
