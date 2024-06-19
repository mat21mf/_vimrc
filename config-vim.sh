

if [[ ! -d ~/.vim ]] ; then mkdir -p ~/.vim ; fi

if [[ ! -f ~/.vim/.vimrc ]] ; then cp -R -p -u .vimrc   ~/.vim/.vimrc ; fi
if [[ ! -d ~/.vim/bundle ]] ; then cp -R -p -u bundle   ~/.vim/bundle ; fi
if [[ ! -d ~/.vim/spell  ]] ; then cp -R -p -u spell    ~/.vim/spell ; fi

if [[ ! -d ~/.vim/backup ]] ; then mkdir -p  ~/.vim/backup ; fi
if [[ ! -d ~/.vim/tmp    ]] ; then mkdir -p  ~/.vim/tmp ; fi

# vundle

if [[ ! -d ~/.vim/bundle/Vundle ]] ; then
    cd ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim
fi

# all plugins
vim -c 'PluginInstall' -c 'qa!'

# ycm

sudo apt install --no-install-recommends cmake python3-dev build-essential
if [[ ! -d ~/.vim/bundle/YouCompleteMe ]] ; then
    cd ~/.vim/bundle/
    git clone https://github.com/ycm-core/YouCompleteMe
fi
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --verbose
