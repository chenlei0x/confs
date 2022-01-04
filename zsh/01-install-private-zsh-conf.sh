#!/bin/bash

p=$(readlink -f zshrc)
if [ -n "$(grep $p ~/.zshrc)" ]; then
    echo already installed
    exit
fi

echo "source $p" >> ~/.zshrc
