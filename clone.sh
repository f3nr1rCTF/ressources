#!/bin/bash

cd Documents/

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone git@github.com:urbanadventurer/username-anarchy.git

git clone git@github.com:r3motecontrol/Ghostpack-CompiledBinaries.git

git clone git@github.com:Xyan1d3/SharpEvader.git

git clone git@github.com:carlospolop/PEASS-ng.git

git clone git@github.com:digininja/RSMangler.git

git clone git@github.com:zrax/pycdc.git

mkdir htb
cd htb
git clone git@github.com:f3nr1rCTF/boxes.git
cd ..
git clone git@github.com:f3nr1rCTF/academy.git

cd 

sudo mv .zshrc .zshrc.back
sleep 1
sudo wget https://raw.githubusercontent.com/f3nr1rCTF/ressources/main/.zshrc
