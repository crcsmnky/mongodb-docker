# MongoDB and Docker

This is a basic Dockerfile and associated configuration elements for deploying MongoDB containers.

## Building

    docker build -t mongodb .

## Running

To start up a basic container and expose a port to the host:

    docker run -d --name=mongodb -p 27017:27017 mongodb

To start up a container with additional MongoDB parameters (e.g. `--smallfiles`),
just add them to the `run` command:

    docker run -d --name=mongodb -p 27017:27017 mongodb --smallfiles

To map a volume to the MongoDB `dbpath` add the `-v` flag and the volume info:

    docker run -d --name=mongodb -p 27017:27017 -v /path/to/volume:/data mongodb

## Notes
- The Dockerfile and `mongod.conf` file are somewhat simplistic so that additional parameters can be
supplied via the `docker run` command to set individual settings like ports, volumes, etc.
- When deploying this container you'll want to have replication go across hosts and stagger
PRIMARY and SECONDARY nodes across shards to have a redundant deployment capable of handling failover