#!/bin/bash

sudo apt install ccrypt exa grc tmux neovim

cd /Documents
mkdir htb
cd htb
git clone git@github.com:f3nr1rCTF/boxes.git
cd ..
git clone git@github.com:f3nr1rCTF/academy.git
git clone git@github.com:f3nr1rCTF/ressources.git
cd /
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


cd .config
mkdir nvim
cd nvim

cd / 

sudo apt install nodejs
sudo apt install npm
sudo npm install --global yarn
sudo npm install --global npm