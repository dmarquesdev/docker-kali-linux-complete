#!/bin/bash

service tor start
service postgresql start
service apache2 start

exec $@
