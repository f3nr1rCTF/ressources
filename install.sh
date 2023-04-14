#!/bin/bash


git config --global user.email "w0lf15@protonmail.com"
git config --global user.name "f3nr1rCTF"             

sleep 1

cd /

sudo wget https://raw.githubusercontent.com/f3nr1rCTF/ressources/main/.tmux.conf

cd /
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

cd .config
mkdir kitty nvim

cd nvim
sudo wget https://raw.githubusercontent.com/f3nr1rCTF/ressources/main/init.vim
cd ..
cd kitty && sudo wget https://raw.githubusercontent.com/jakescheetz/dotfiles/main/kitty.conf

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"




#cd /home/f3nr1r/.local/share/nvim/plugged/coc.nvim
#yarn
