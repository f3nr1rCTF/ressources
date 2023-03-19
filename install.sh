#!/bin/bash

sudo apt install -y ccrypt exa grc tmux neovim



sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git config --global user.email "w0lf15@protonmail.com"
git config --global user.name "f3nr1rCTF"             


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
cp /home/f3nr1r/ressources/config-mac-master/init.vim .

cd / 
cp /home/f3nr1r/ressources/config-mac-master/.tmux.conf .

sudo apt install nodejs
sudo apt install npm
sudo npm install --global yarn
sudo npm install --global npm

#cd /home/f3nr1r/.local/share/nvim/plugged/coc.nvim
#yarn