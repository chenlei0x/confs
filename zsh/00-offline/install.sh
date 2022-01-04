#!/bin/bash

mkdir oh-my-zsh
tar -C oh-my-zsh -xf ./oh-my-zsh.tar.gz

p=$(readlink -f zshrc)
ln -s $p ~/.zshrc

p=$(readlink -f oh-my-zsh)
ln -s $p ~/.oh-my-zsh
