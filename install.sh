#!/bin/sh
set -e
mv ~/.vimrc ~/.vimrc_bakk

cd ~/ownvimconfig

echo 'set runtimepath+=~/ownvimconfig

source ~/ownvimconfig/vimrcs/basic.vim
source ~/ownvimconfig/vimrcs/plugin.vim
source ~/ownvimconfig/vimrcs/mapper.vim
try
source ~/ownvimconfig/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
