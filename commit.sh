#!/bin/bash

CONTAINER_ID=$(docker container ps | grep kali-complete | cut -d " " -f1)
docker commit $CONTAINER_ID kali-complete
