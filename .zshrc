# Lines configured by zsh-newuser-install
EDITOR=nvim
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gregofi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# aliases
# working with .dotfiles
alias hgit="git --git-dir=${HOME}/.dotfiles --work-tree=$HOME"

alias n=nvim
alias d=docker
alias p=pacman
alias dc=docker compose
alias g=git
