#!/bin/bash

sudo apt update
sudo apt upgrade


mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
