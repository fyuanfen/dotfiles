# Dot Files


I am running on Mac OS X, but it will likely work on Linux as well.


## Installation
### offline installation

if you install it offline，run the following steps
dotfile离线安装

1. Before start, install git and zsh
```
sudo apt-get install git-core zsh
```
2. Go to the repository and download the zip file

 https://github.com/robbyrussell/oh-my-zsh

Open the zip file and extract to your home folder, and rename to .oh-my-zsh
```
oh-my-zsh-master -> ~/.oh-my-zsh
```


3. Set default sh
```
chsh -s `which zsh`
```
4. Restart!



### configure steps

Run the following commands in your terminal. It will prompt you before it does anything destructive. Check out the [Rakefile](https://github.com/fyuanfen/dotfiles/blob/master/Rakefile) to see exactly what it does.

```terminal
git clone git@github.com:fyuanfen/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
rake install
```

After installing, open a new terminal window to see the effects.

Feel free to customize the .zshrc file to match your preference.


## Uninstall

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
