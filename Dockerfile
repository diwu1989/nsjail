FROM ubuntu:20.04

RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    autoconf \
    bison \
    flex \
    gcc \
    g++ \
    git \
    libprotobuf-dev \
    libnl-route-3-dev \
    libtool \
    make \
    pkg-config \
    protobuf-compiler \
    && rm -rf /var/lib/apt/lists/*

COPY . /nsjail

RUN cd /nsjail && make && mv /nsjail/nsjail /bin && rm -rf -- /nsjail
