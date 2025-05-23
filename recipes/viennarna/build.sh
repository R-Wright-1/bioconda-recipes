#!/bin/bash

## Choose extra configure options depending on the operating system
## (mac or linux)
##
if [ `uname` == Darwin ] ; then
    extra_config_options="--without-perl LDFLAGS=-Wl,-headerpad_max_install_names"
fi

## Configure and make
./configure --prefix=$PREFIX \
            --with-kinwalker \
            --with-cluster \
            --disable-lto \
            --without-doc \
            --without-cla \
            --without-rnaxplorer \
            --disable-silent-rules \
            ${extra_config_options} && \
make -j${CPU_COUNT}

## Install
make install
