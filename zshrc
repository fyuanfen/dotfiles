ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"
ZSH_CUSTOM=$HOME/.dotfiles/oh-my-zsh/custom

DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

export CLICOLOR=1
export LSCOLORS=1212121212121212121212

export EDITOR=vim

plugins=(git brew extract z rbates zsh-autosuggestions zsh-syntax-highlighting)

export PATH="/usr/local/bin:$PATH"

source $ZSH/oh-my-zsh.sh

#Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,aliases,functions,extra,exports,local}; do
  [ -r "$file"  ] && [ -f "$file"  ] && source "$file";
  done;
  unset file;
#
#
 # for Homebrew installed rbenv
 # if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
  
