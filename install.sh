#!/bin/sh
set -e
mv ~/.vimrc ~/.vimrc_bakk

cd ~/ownvimconfig

echo 'set runtimepath+=~/ownvimconfig

source ~/ownvimconfig/vimrc/basic.vim
source ~/ownvimconfig/vimrc/plugin.vim
source ~/ownvimconfig/vimrc/mapper.vim
try
source ~/ownvimconfig/my_configs.vim
catch
endtry' > ~/.vimrc

git submodule init
git submodule update

cd ~/ownvimconfig/bundle/coc.nvim
./install.sh

cd ~/ownvimconfig/bundle/LeaderF
./install.sh

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
