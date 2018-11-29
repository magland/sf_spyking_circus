#!/bin/bash

docker run --privileged -v $PWD:/working magland/singularity:2.6.0 \
  --user $(id -u):$(id -g) \
  bash -c "cd /working && singularity build sf_spyking_circus.simg Singularity.v0.1.0"
