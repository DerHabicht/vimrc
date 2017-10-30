ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/vimrc ~/.ideavimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
