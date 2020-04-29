#!/bin/sh
set -e
mv ~/.vimrc ~/.vimrc_bakk

cd ~/vim_runtime

echo 'set runtimepath+=~/vim_runtime

source ~/vim_runtime/vimrcs/basic.vim
source ~/vim_runtime/vimrcs/plugin.vim
source ~/vim_runtime/vimrcs/mapper.vim
try
source ~/vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
