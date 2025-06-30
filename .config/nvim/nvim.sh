#!/bin/bash
# https://gorm.dev/install-neovim-on-amazon-linux-2

echo "Remove cmake"
sudo yum remove cmake

echo "Install gcc-c++"
sudo yum install gcc-c++

echo "Grab cmake"
wget https://cmake.org/files/v3.10/cmake-3.10.0.tar.gz

echo "Extract"
tar -xvzf cmake-3.10.0.tar.gz

echo "Install"
cd cmake-3.10.0
# I be Bootstrappin'
./bootstrap

# make the thing
make

# make all the things
sudo make install

echo "Install NVIM"
sudo pip-3.7 install neovim --upgrade
cd "$(mktemp -d)"
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout 040f1459849ab05b04f6bb1e77b3def16b4c2f2b
# git clone https://github.com/neovim/neovim/tree/5a38e951ec1532ba1ee8b35b42181003866d479c.git

# This takes forever
make CMAKE_BUILD_TYPE=Release

# This takes even longer
make install

# Install tmux 3.0a on Centos

# install deps
sudo yum install -y gcc kernel-devel make ncurses-devel

# DOWNLOAD SOURCES FOR LIBEVENT AND MAKE AND INSTALL
curl -LOk https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz
tar -xf libevent-2.1.11-stable.tar.gz
cd libevent-2.1.11-stable
./configure --prefix=/usr/local
make
sudo make install

# DOWNLOAD SOURCES FOR TMUX AND MAKE AND INSTALL

curl -LOk https://github.com/tmux/tmux/releases/download/3.0a/tmux-3.0a.tar.gz
tar -xf tmux-3.0a.tar.gz
cd tmux-3.0a
LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/local
make
sudo make install

# pkill tmux
# close your terminal window (flushes cached tmux executable)
# open new shell and check tmux version
tmux -V
