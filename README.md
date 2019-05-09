# Dot Files

I am running on Mac OS X, but it will likely work on Linux as well.

## Installation

### offline installation

## 安装

### 离线安装

离线安装请使用 build 分支

裸机安装步骤

1. [安装 git](./doc/git-install.md)
2. [安装 vim7.4 以上的版本](./doc/vim-install.md)
3. 配置步骤

```terminal
git clone git@git.code.oa.com:yurielzhang/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./build-install.sh
```

## 卸载步骤

To remove the dotfile configs, run the following commands. Be certain to double check the contents of the files before removing so you don't lose custom settings.

```
unlink ~/.bin
unlink ~/.gitignore
unlink ~/.gemrc
unlink ~/.gvimrc
unlink ~/.irbrc
unlink ~/.vim
unlink ~/.vimrc
rm ~/.zshrc # careful here
rm ~/.gitconfig
rm -rf ~/.dotfiles
rm -rf ~/.oh-my-zsh
chsh -s /bin/bash # change back to Bash if you want
```

Then open a new terminal window to see the effects.
