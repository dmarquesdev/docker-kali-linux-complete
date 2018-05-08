# Docker Kali Linux - Full

This repository contains the configuration that I use for running Kali Linux inside a docker container.

Right now it's configured for my environment, inputing some aliases on .zshrc file

## Install
```sh
git clone https://github.com/dmarquesdev/docker-kali-linux-complete.git docker-kali
cd docker-kali
./setup.sh
source ~/.zshrc
./build.sh
```

## Running
Open a terminal and input `kali`

## Git Apps
The *git-apps* folder contains the submodules from this repository, and is mapped as a volume on `/opt/tools`.
To add new tools, the best way is to do the following:
```sh
cd git-apps
git submodule add <repoURL>
```

The tools will be available inside the container.

## Volumes
/root - Root home directory
/var/lib/postgresql - PostgreSQL database files (persisting Metasploit database)
/opt/tools - Bind to *git-apps* directory

## Exposed Ports
(Container -> Host)
9050 -> 9050 - Tor Network
80 -> 8000 - Apache2 Web Server

## Updating
There's a script to update the system and the git apps inside the image.

To update the dependencies, run (from within the container):
```sh
update
```

To persist these updates (if you don't do that, all updates will be lost when the container is shutdown), run:
```sh
kali-commit
```

## Changelog
- v1.0.0 - Initial Setup
