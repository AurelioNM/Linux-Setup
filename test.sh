#!/bin/bash

echo 'NVIM setup!'

#update
sudo apt-get update -y
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip -y

#build nvim
mkdir git
cd git
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
cd

echo 'KICKSTART setup!'

#config kickstart nvim
mkdir -p .config/nvim
cd .config/nvim
git clone git@github.com:nvim-lua/kickstart.nvim.git
cd kickstart.nvim 
mv * ..
cd ..
rm -rf cd kickstart.nvim

echo 'Done!'

