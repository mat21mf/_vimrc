

if [[ ! -d ~/.vim ]] ; then mkdir -p ~/.vim ; fi

if [[ ! -d ~/.vim/.vimrc ]] ; then cp -R -p -u .vimrc   ~/.vim/.vimrc ; fi
if [[ ! -d ~/.vim/bundle ]] ; then cp -R -p -u bundle   ~/.vim/bundle ; fi
if [[ ! -d ~/.vim/spell  ]] ; then cp -R -p -u spell    ~/.vim/spell ; fi

if [[ ! -d ~/.vim/backup ]] ; then mkdir -p  ~/.vim/backup ; fi
if [[ ! -d ~/.vim/tmp    ]] ; then mkdir -p  ~/.vim/tmp ; fi

# vundle

cd ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim

# all plugins
vim -c 'PluginInstall' -c 'qa!'

# ycm

sudo apt install --no-install-recommends cmake python3-dev build-essential
cd ~/.vim/bundle/YouCompleteMe
./install.py --verbose
