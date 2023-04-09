#!/bin/bash

#update
sudo apt-get update -y
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
sudo apt autoremove -y


#nvim
mkdir git
cd git
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
cd

echo 'Done!'

