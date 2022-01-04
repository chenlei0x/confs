#! /bin/bash

wget https://github.com/antontkv/tmux-appimage/releases/download/3.2a/tmux-3.2a-x86_64.appimage
mkdir -p /opt/tmux/bin
mv tmux-3.2a-x86_64.appimage /opt/tmux/bin/tmux
chmod a+x /opt/tmux/bin/tmux
