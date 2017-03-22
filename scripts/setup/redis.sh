#!/bin/bash

USER="${1:-admin}"
REDIS_LOG_DIR=/var/log/redis
REDIS_PERSIST_DIR=/var/lib/redis
REDIS_CONFIG_DIR=/etc/redis
REDIS_BIND_HOST=0.0.0.0
REDIS_CONFIG_FILE=redis.conf

#####Setup redis and dependencies
#apt-get update
apt-get install -y redis-server
chown -R "$USER:$USER" "$REDIS_LOG_DIR" "$REDIS_PERSIST_DIR" "$REDIS_CONFIG_DIR"

#fix redis config bug
sed -i -- 's/bind 127.0.0.1/bind '"$REDIS_BIND_HOST"'/g' "$REDIS_CONFIG_DIR/$REDIS_CONFIG_FILE"
#change to appendonly
sed -i -- 's/^appendonly no/appendonly yes/g' "$REDIS_CONFIG_DIR/$REDIS_CONFIG_FILE"
