#! /bin/bash
install_path="/opt/tmux"
wget https://github.com/antontkv/tmux-appimage/releases/download/3.2a/tmux-3.2a-x86_64.appimage
mkdir -p /opt/tmux/
mv tmux-3.2a-x86_64.appimage $install_path/tmux
chmod a+x $install_path/tmux
