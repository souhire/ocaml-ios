ocaml-ios
=========

1. Requirements
You need to build ios-clang, a toolchain based on clang for iOS that you can find on github.com/souhire/iostoolchain. 
You can use our script to built it automatically and install it in your home directory, or modify it to install where your want.
In order to run your OCaml programs, you need to have jailbroken iOS devices.
2. Installation
To install it, you just have to make git clone and once in the directory ocaml-ios run ./install.sh 
3. Run
If you have OCaml 3.12.1 installed in your computer: ocamlrun $HOME/toolchain/3.12.1-ios/bin/ocamlopt to compile OCaml programs for iOS.
If you have other version of OCaml : $HOME/toolchain/ocaml-3.12.1.host/byterun/ocamlrun $HOME/toolchain/3.12.1-ios/bin/ocamlopt

