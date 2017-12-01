#!/usr/bin/env bash

# actually untested, sorry

cd "$(dirname "$(readlink -f "$0")")"    #'"%#@!

sudo dnf install \
      git pkgconfig automake autoconf ncurses-devel python \
      python-zmq wget gtest-devel gcc gcc-c++ libtool patch

./fetch-params.sh || exit 1

./build.sh --disable-tests --disable-rust -j$(nproc) || exit 1

if [ ! -r ~/.gravitonium/gravitonium.conf ]; then
   mkdir -p ~/.gravitonium
   echo "rpcuser=username" >>~/.gravitonium/gravitonium.conf
   echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >>~/.gravitonium/gravitonium.conf
fi

cd ../src/
cp -f zcashd gravitoniumd
cp -f zcash-cli gravitonium-cli
cp -f zcash-tx gravitonium-tx

echo ""
echo "--------------------------------------------------------------------------"
echo "Compilation complete. Now you can run ./src/gravitoniumd to start the daemon."
echo "It will use configuration file from ~/.gravitonium/gravitonium.conf"
echo ""
