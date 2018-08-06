#!/bin/bash
if [ -z "$1" ]; then
	echo "Stopping week old containers"
	docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs --no-run-if-empty docker stop 
	exit 1
fi
echo "Stopping all containers"
docker ps -a | grep 'ago' | awk '{print $1}' | xargs --no-run-if-empty docker stop
