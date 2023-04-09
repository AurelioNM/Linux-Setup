#!/bin/bash

#update
sudo apt update -y
sudo apt install -y git vim zsh wget unzip jq telnet curl htop terminator tmux docker docker-compose nvm python3 python3-pip ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
sudo apt autoclean -y
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

