#!/bin/bash

DOWNLOAD=`pwd`;

cd $HOME/toolchain;
#mkdir 3.12.1-ios;
wget http://caml.inria.fr/pub/distrib/ocaml-3.12/ocaml-3.12.1.tar.gz;
tar xvf ocaml-3.12.1.tar.gz;
cp -a ocaml-3.12.1 ocaml-3.12.1.host;
cd ocaml-3.12.1;
patch -p1 < $DOWNLOAD/patch.ocaml-3.12.1-ios-clang;


cd ../ocaml-3.12.1.host;
./configure;
make world;

cd $HOME/toolchain/ocaml-3.12.1;
cp $DOWNLOAD/cross_compile_conf.arm-apple-darwin11 config/auto-aux/;
export TOOLCHAIN=$HOME/toolchain;
export OCAMLHOST=$TOOLCHAIN/ocaml-3.12.1.host;
export ACC="$TOOLCHAIN/bin/ios-clang -I$TOOLCHAIN/share/iPhoneOS4.2.sdk/usr/lib/gcc/arm-apple-darwin10/4.2.1/include/ -I$TOOLCHAIN/share/iPhoneOS4.2.sdk/usr/include/ -isysroot $TOOLCHAIN/share/iPhoneOS4.2.sdk";
./configure -verbose -prefix $TOOLCHAIN/3.12.1-ios -host arm-apple-darwin11  -cc "$ACC" -as "$ACC -c" -aspp "$ACC -c" -partialld "arm-apple-darwin11-ld -r";
make world;
make opt;
make install;


