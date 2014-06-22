#!/bin/sh

rsync -a --exclude bundle/* ~/.vim/ .
rsync -a ~/.vimrc vimrc
