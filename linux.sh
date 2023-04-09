#!/bin/bash

#update
sudo apt update -y
sudo apt install -y git vim zsh wget unzip jq telnet curl htop terminator tmux docker docker-compose python3 python3-pip
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

#change workdir to Home
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

echo 'Done!'

