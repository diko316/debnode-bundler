#!/bin/sh

WORKDIR=$(dirname $(readlink -f $0))
NPM_INSTALL_BIN=/usr/local/bin/npm-install

cp ${WORKDIR}/npm-install.sh ${NPM_INSTALL_BIN} && \
    chmod +x ${NPM_INSTALL_BIN} && \
    cd ${PROJECT_ROOT} && \
    apt-get update && \
    apt-get install -y \
                build-essential \
                chrpath \
                libssl-dev \
                libxft-dev \
                libfreetype6 \
                libfreetype6-dev \
                libfontconfig1 \
                libfontconfig1-dev \
                autoconf \
                libtool \
                python \
                pkg-config \
                nasm && \
    npm install -y -d -g --unsafe-perm \
                mozjpeg \
                gifsicle \
                optipng \
                pngquant \
                svgo && \
    apt-get purge -y \
                build-essential \
                chrpath \
                libssl-dev \
                autoconf \
                libtool \
                python \
                pkg-config \
                nasm && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ || exit 1


exit 0