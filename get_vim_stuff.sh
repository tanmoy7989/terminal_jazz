git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ./vimrc ~/.vim/vimrc
ln -s ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall
