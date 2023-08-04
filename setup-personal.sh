#!/bin/bash

#update
sudo apt update -y
sudo apt install -y git vim zsh wget unzip jq telnet curl htop terminator tmux docker docker-compose nvm python3 python3-pip python3-venv alsamixer kazam
sudo apt autoclean -y
sudo apt autoremove -y

#add user to sudo-docker
sudo usermod -aG docker $USER

git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git
./nerd-fonts/install.sh
rm -rf nerd-fonts

#install exa (new LS)
wget https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip
sudo unzip -o -j exa-linux-x86_64-v0.10.1.zip "bin/exa" -d /usr/bin
rm exa-linux-x86_64-v0.10.1.zip

#Prepare tmux
mkdir ~/.tmux
cp .tmux.* ~/.tmux
cp start-tmux.sh ~/
cd

#Oh-my-tmux
git clone --depth=1 https://github.com/gpakosz/.tmux.git ~/.tmux

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/g' .zshrc
echo 'alias ls="exa -hHBmgaFl --git"' >> ~/.zshrc
echo 'alias t="tmux"' >> ~/.zshrc
echo 'alias ta="t a -t"' >> ~/.zshrc
echo 'alias tls="t ls"' >> ~/.zshrc
echo 'alias tn="t new -t"' >> ~/.zshrc

sudo snap install insomnia -y
sudo snap install intellij-idea-community --classic
sudo add-apt-repository ppa:serge-rider/dbeaver-ce -y
sudo apt update
sudo apt install dbeaver-ce

#prepare for nvim
echo 'NVIM setup!'
sudo apt-get update -y
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip snapd -y

#install nvim
mkdir git
cd git
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
cd

#config kickstart nvim
echo 'NVIM KICKSTART setup!'
mkdir -p .config/nvim
cd .config/nvim
git clone https://github.com/nvim-lua/kickstart.nvim.git 
cd kickstart.nvim 
mv * ..
cd ..
rm -rf cd kickstart.nvim

echo 'Done Linux Prepare!'
