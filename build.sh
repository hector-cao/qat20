#!/bin/bash

sudo apt install pkg-config \
     zlib1g-dev \
     libboost-dev \
     libboost-regex-dev \
     libudev-dev \
     yasm

./configure
make
