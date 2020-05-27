git clone git@github.com:VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
cp ./vimrc $HOME/.vim/vimrc
ln -s $HOME/.vim/vimrc $HOME/.vimrc
vim +PluginInstall +qall
