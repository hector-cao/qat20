#!/bin/bash

sudo apt install pkg-config \
     zlib1g-dev \
     libboost-dev \
     libboost-regex-dev \
     libudev-dev \
     yasm

./configure
make

#sudo make install

sudo apt install libssl-dev

make samples

export ICP_ROOT=$PWD

(cd quickassist/lookaside/access_layer/src/sample_code/functional/sym/cipher_sample/ && make)
(cd quickassist/lookaside/access_layer/src/sample_code/functional/sym/ssl_sample/ && make)
(cd quickassist/lookaside/access_layer/src/sample_code/functional/asym/prime_sample/ && make)
(cd quickassist/lookaside/access_layer/src/sample_code/functional/asym/diffie_hellman_sample/ && make)

# NB
# [   35.896979] 4xxx 0000:6b:00.0: Cannot use PF with IOMMU enabled
# -> remove intel_iommu=on in kernel argument

# samples applications : https://github.com/intel/qatlib/blob/abe15d7bfc083117bfbb4baee0b49ffcd1c03c5c/INSTALL#L306
# To run tests SYM crypto ONLY
# sudo ./build/cpa_sample_code runTests=1

# To run compression tests ONLY
# sudo ./build/cpa_sample_code runTests=32
