#!/usr/bin/env bash

cd "$(dirname "$(readlink -f "$0")")"    #'"%#@!

sudo apt-get install \
      build-essential pkg-config libc6-dev m4 g++-multilib \
      autoconf libtool ncurses-dev unzip git python python-zmq \
      zlib1g-dev wget bsdmainutils automake

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
echo "Compilation complete. Now you can run ./src/gravitonium to start the daemon."
echo "It will use configuration file from ~/.gravitonium/gravitonium.conf"
echo ""
