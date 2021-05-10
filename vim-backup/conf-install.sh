#!/bin/bash

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#install plug.vim
if [ -z $(find ${XDG_DATA_HOME:-$HOME/.local/share}/nvim -name plug.vim) ]
then
	echo =====OOPS!!! Using offline plug.vim ======
	cp ./offline-plugins/plug.vim ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim
fi

# install init.vim
echo installing init.vim
mkdir -p ~/.config/nvim/ || true
ln -s $(readlink -f init.vim) ~/.config/nvim/init.vim > /dev/null 2>&1|| echo ~/.config/nvim/init.vim exists
echo "two ways to install vim plugs"
echo "1. run PluginInstall in vim"
echo "2. use offline-plugins/extract.sh to install "

