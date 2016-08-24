#!/bin/bash
set -e

# redis
redis-server /etc/redis/redis.conf

# memcached
memcached -d -u daemon

# sphinx

# go
/docker/dev-go

exec "$@"
