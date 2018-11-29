FROM ubuntu:16.04

RUN apt-get update && apt-get install -y python dh-autoreconf build-essential libarchive-dev
RUN apt-get install -y git

RUN git clone https://github.com/sylabs/singularity.git /src/singularity
WORKDIR /src/singularity
RUN git fetch --all && git checkout 2.6.0
RUN ./autogen.sh
RUN ./configure --prefix=/usr/local
RUN make
RUN make install

RUN apt-get install -y squashfs-tools