#!/bin/sh
basepath=$(cd `dirname $0`; pwd)

git submodule init
git submodule update

# 配置文件使用软引用
ln -siF ${basepath}/.vimrc $HOME/

if [ -d ~/.vim ]; then
    echo "~/.vim dir has exited ,press any key to delete...."
    read
    # rm -rf ~/.vim
fi

# 目录复制过去
cp -rf ${basepath}/.vim ~/.
# ln -siF ${basepath}/.vim $HOME/
