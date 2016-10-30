pwd
dirname $0
basepath=$(cd `dirname $0`; pwd)
echo $basepath

if [ -d ~/.vim ]; then
    rm -rf ~/.vim
fi
