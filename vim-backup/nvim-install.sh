#!/bin/bash

chmod a+x ./nvim.appimage
./nvim.appimage --appimage-extract
chmod a-x ./nvim.appimage

target_dir=/opt/nvim
if [ -d $target_dir ]
then
	echo $target_dir exists, Failed!!!!
	exit 0
fi

mv squashfs-root/ /opt/nvim
ln -sf $target_dir/usr/bin/nvim $target_dir/usr/bin/vim
