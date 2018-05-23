#!/bin/bash

service tor start
service postgresql start
service apache2 start
/opt/arachni/bin/arachni_web -D -o 0.0.0.0

exec $@
