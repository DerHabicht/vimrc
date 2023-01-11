pip3 install --user pynvim
mkdir -p $HOME/.config/nvim/
cp $HOME/.vim/init.vim $HOME/.config/nvim/
ln -s $HOME/.vim/vimrc $HOME/.vimrc
ln -s $HOME/.vim/vimrc $HOME/.ideavimrc
ln -s $HOME/.vim/gvimrc $HOME/.gvimrc
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
/usr/local/bin/python3.10 install.py --go-completer --js-completer --java-completer
