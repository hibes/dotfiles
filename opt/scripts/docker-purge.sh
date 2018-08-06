#!/bin/bash
if [ -z "$1" ]; then
	echo "Purging week old containers"
	docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm
	exit 1
fi
echo "Purging all containers"
docker ps -a | grep 'ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm
