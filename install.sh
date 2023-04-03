#!/bin/bash

sudo apt install -y ccrypt
sudo apt install -y exa
sudo apt install -y grc
sudo apt install -y tmux
sudo apt install -y neovim
sudo apt install -y kitty


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git config --global user.email "w0lf15@protonmail.com"
git config --global user.name "f3nr1rCTF"             

sleep 5
cd /

sudo mv .zshrc .zshrc.back
sudo wget https://raw.githubusercontent.com/f3nr1rCTF/ressources/main/.zshrc
sudo wget https://raw.githubusercontent.com/f3nr1rCTF/ressources/main/.tmux.conf
cd /Documents
mkdir htb
cd htb
git clone git@github.com:f3nr1rCTF/boxes.git
cd ..
git clone git@github.com:f3nr1rCTF/academy.git
cd /
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

cd .config
mkdir kitty nvim

cd nvim
sudo wget https://raw.githubusercontent.com/f3nr1rCTF/ressources/main/config-mac-master/init.vim
cd ..
cd kitty && sudo wget https://raw.githubusercontent.com/jakescheetz/dotfiles/main/kitty.conf


sudo apt install nodejs
sudo apt install npm
sudo npm install --global yarn
sudo npm install --global npm

#cd /home/f3nr1r/.local/share/nvim/plugged/coc.nvim
#yarn
