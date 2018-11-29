#!/bin/bash

## This will be the command we run inside docker container
cmd="cd /working"

## Create the dummy user and group to match the host user/group
cmd="$cmd && groupadd -g $(id -g) tmpgroup"
cmd="$cmd && useradd -u $(id -u) -g $(id -g) -d /home/tmpuser -s /bin/bash -p nopass tmpuser"

## Here is the singularity build command
cmd="$cmd && singularity build /tmp/out.simg Singularity.v0.1.0"

## Change the ownership of the file and move it over, acting as that user (yikes)
cmd="$cmd && chown $(id -u):$(id -g) /tmp/out.simg"
cmd="$cmd && su tmpuser -c \"mv /tmp/out.simg sf_spyking_circus.simg\""

## Run the command inside the docker container
docker run --privileged -v $PWD:/working magland/singularity:2.6.0 \
  bash -c "$cmd"
