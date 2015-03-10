#!/bin/sh

echo 'rsync -av --exclude bundle ~/.vim/ . :\n'
rsync -av --exclude bundle ~/.vim/ .

echo '\nrsync -av ~/.vimrc vimrc :\n'
rsync -av ~/.vimrc vimrc
