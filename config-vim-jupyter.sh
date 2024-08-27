
MYHOME="$HOME/work"

## load directories
if [[ ! -d $MYHOME/.vim ]] ; then mkdir -p $MYHOME/.vim ; fi

if [[ ! -f $MYHOME/.vim/.vimrc ]] ; then cp -R -p -u .vimrc   $MYHOME/.vim/.vimrc ; fi
if [[ ! -d $MYHOME/.vim/bundle ]] ; then cp -R -p -u bundle   $MYHOME/.vim/bundle ; fi
if [[ ! -d $MYHOME/.vim/spell  ]] ; then cp -R -p -u spell    $MYHOME/.vim/spell ; fi

if [[ ! -d $MYHOME/.vim/backup ]] ; then mkdir -p  $MYHOME/.vim/backup ; fi
if [[ ! -d $MYHOME/.vim/tmp    ]] ; then mkdir -p  $MYHOME/.vim/tmp ; fi

## load vimrc
if [[ ! -f $MYHOME/.vimrc ]] ; then ln -s $MYHOME/.vim/.vimrc $MYHOME/.vimrc ; fi

## setup vundle
if [[ ! -d $MYHOME/.vim/bundle/Vundle.vim ]] ; then
    cd $MYHOME/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim
else
    cd $MYHOME/.vim/bundle/Vundle.vim
    git pull
fi

## all plugins
vim -c 'PluginInstall' -c 'qa!'

## ycm
sudo apt install --no-install-recommends cmake python3-dev build-essential -y
if [[ ! -d $MYHOME/.vim/bundle/YouCompleteMe ]] ; then
    cd $MYHOME/.vim/bundle/
    git clone https://github.com/ycm-core/YouCompleteMe
fi
cd $MYHOME/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --verbose
