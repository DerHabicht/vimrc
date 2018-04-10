ln -s $HOME/.vim/vimrc $HOME/.vimrc
ln -s $HOME/.vim/vimrc $HOME/.ideavimrc
ln -s $HOME/.vim/gvimrc $HOME/.gvimrc
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py --all
