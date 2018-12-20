ZSH=$HOME/.oh-my-zsh

ZSH_THEME="rbates"
ZSH_CUSTOM=$HOME/.dotfiles/oh-my-zsh/custom

DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

export CLICOLOR=1
export LSCOLORS=1212121212121212121212


plugins=(git brew extract z rbates zsh-autosuggestions zsh-syntax-highlighting)

export PATH="/usr/local/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
