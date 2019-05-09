#!/bin/sh
chsh -s `which zsh`
arr=(zshrc tmux.conf vim vimrc exports extra functions)

for var in ${arr[@]};
do
    rm -rf $HOME/.$var 
    ln -s $PWD/$var $HOME/.$var
    echo $PWD/$var
done

if [ ! -d "$HOME/.oh-my-zsh" ];then
    unzip oh-my-zsh-master.zip -d $HOME/
    mv oh-my-zsh-master/ $HOME/.oh-my-zsh
fi

source ~/.zshrc
