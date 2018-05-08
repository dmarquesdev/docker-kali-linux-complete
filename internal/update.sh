#!/bin/bash

apt-get update && apt-get dist-upgrade -y
/opt/tools/discover/update.sh

for tool in $(ls /opt/tools); do
	cd /opt/tools/$tool && git pull
done
