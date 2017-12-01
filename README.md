Gravitonium 1.0.13
=============

What is Gravitonium?
-----------------

[Gravitonium](https://gravitonium.org/) is an implementation of the "Zerocash" protocol.
Forked from ZCash, based on Bitcoin's code, it intends to offer a far higher standard of privacy
through a sophisticated zero-knowledge proving scheme that preserves
confidentiality of transaction metadata. Technical details are available
in our [Protocol Specification](https://github.com/zcash/zips/raw/master/protocol/protocol.pdf).

This software is the Gravitonium client. It downloads and stores the entire history
of Gravitonium transactions; depending on the speed of your computer and network
connection, the synchronization process could take a day or more once the
blockchain has reached a significant size.

Security Warnings
-----------------

**Gravitonium is experimental and a work-in-progress.** Use at your own risk.

Building
--------

If you prefer to build Gravitonium from source code, you can do so by running
the following commands in Linux:

    git clone https://github.com/Graviteam/Gravitonium.git
    cd ./Gravitonium/zcutil
    ./gravitonium_build_debian.sh # for debian/ubuntu based systems

This will also setup your gravitonium.conf file in ~/.gravitonium directory, if the file does not exist yet.


Configuring
-----------

The above mentioned command should configure your gravitonium already by creating ~/.gravitonium/gravitonium.conf for you. The file can be generated manually by running

    mkdir -p ~/.gravitonium
    echo "addnode=gravitonium.org" >~/.gravitonium/gravitonium.conf
    echo "rpcuser=username" >>~/.gravitonium/gravitonium.conf
    echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >>~/.gravitonium/gravitonium.conf


Mining
------

Solo mining with CPU is currently not worth. If you plan to mine VoteCoin, you should
join a pool. There are several pools in operation at the moment, for example:

    http://zpool.space

License
-------

For license information see the file [COPYING](COPYING).
