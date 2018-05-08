#!/bin/bash
docker container run -it --rm -p 9050:9050 -p 8000:80 --mount type=bind,src=/Users/diego/projects/docker/kali-complete/git-apps,dst=/opt/tools --mount src=kali-root,dst=/root --mount src=kali-postgres,dst=/var/lib/postgresql kali-complete /bin/bash
