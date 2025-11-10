# Lines configured by zsh-newuser-install
EDITOR=nvim
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

autoload -Uz vcs_info

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '%F{red}✗%f'
zstyle ':vcs_info:git:*' stagedstr '%F{yellow}●%f'
zstyle ':vcs_info:git:*' formats '(%b%u%c)'
# when rebase/merge/cherrypick.. is in progress
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'
zstyle ':vcs_info:*' enable git

precmd() { vcs_info }
setopt prompt_subst

PROMPT='%F{yellow}%~%f %F{magenta}${vcs_info_msg_0_}%f '
RPROMPT='%(?..%F{red}%?%f) %F{blue}%*%f'

setopt autocd
unsetopt beep
bindkey -v
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

zstyle :compinstall filename '/home/gregofi/.zshrc'

autoload -Uz compinit
compinit

# prefix history

# Index of the currently used history entry
# It is not global index in the histfile, but
# index in the list of matched entries (the grep'd result).
FUZZY_HIST_IDX=$(( $HISTSIZE - 1 ))
# The last found history entry
FUZZY_HIST_LAST=""
FUZZY_SEARCH_FOR=""
FUZZY_FOUND_ENTRIES=()

fuzzy_hist_search() {
    # If the text in the buffer does not equal to the last found history,
    # the user must have changed the search term, so we reset the index.
    if [[ "${BUFFER}" != "${FUZZY_HIST_LAST}" ]]; then
        FUZZY_SEARCH_FOR="${BUFFER}"
        FUZZY_FOUND_ENTRIES=()
        while IFS= read -r line; do
            matches+=("${line}")
        done < <(grep -E "${FUZZY_SEARCH_FOR}" "${HISTFILE}" | uniq)
        FUZZY_HIST_IDX="${#matches[@]}"
    fi

    FUZZY_HIST_IDX=$(( FUZZY_HIST_IDX - 1 ))
    FUZZY_HIST_LAST="${matches[${FUZZY_HIST_IDX}]}"

    BUFFER="${FUZZY_HIST_LAST}"
    CURSOR="${#BUFFER}"
    zle redisplay
}

fuzzy_hist_back() {
    if [[ "${BUFFER}" != "${FUZZY_HIST_LAST}" ]]; then
        return
    fi

    FUZZY_HIST_IDX=$(( FUZZY_HIST_IDX + 1 ))
    if [[ "${FUZZY_HIST_IDX}" -ge "${#matches[@]}" ]]; then
        FUZZY_HIST_IDX=$(( ${#matches[@]} - 1 ))
    fi
    FUZZY_HIST_LAST="${matches[${FUZZY_HIST_IDX}]}"

    BUFFER="${FUZZY_HIST_LAST}"
    CURSOR="${#BUFFER}"
    zle redisplay
}

zle -N fuzzy_hist_search
bindkey '^[[A' fuzzy_hist_search
zle -N fuzzy_hist_back
bindkey '^[[B' fuzzy_hist_back

# aliases
# working with .dotfiles
alias hgit="git --git-dir=${HOME}/.dotfiles --work-tree=$HOME"

alias n="nvim"
alias d="docker"
alias pac="pacman"
alias dc="docker compose"
alias p="pnpm"
alias px="pnpm exec"

alias gav="git add -v"
alias gcn!="git commit --amend --no-edit"
alias gpsup="git push"
alias gpsupf="git push --force-with-lease"
alias gco="git checkout"
alias gcm="git commit"
alias grhh="git reset --hard"

alias k=kubectl

alias src="source ~/.zshrc"

alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
