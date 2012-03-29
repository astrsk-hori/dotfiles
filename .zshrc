autoload -U compinit
compinit

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt noautoremoveslash
setopt correct
setopt list_packed

case ${UID} in
0)
    PROMPT="%B%{[31m%}%/#%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%{[31m%}%/%%%{[m%} "
    PROMPT2="%{[31m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac 

# プロンプトのカラー表示を有効
 autoload -U colors
 colors

# Keybind configuration
bindkey -v
 
 # historical backward/forward search with linehead string binded to ^P/^N
 #
 autoload history-search-end
 zle -N history-beginning-search-backward-end history-search-end
 zle -N history-beginning-search-forward-end history-search-end
 bindkey "^P" history-beginning-search-backward-end
 bindkey "^N" history-beginning-search-forward-end
 bindkey "^R" history-incremental-search-backward
  
 # cdでpushdする。
 setopt auto_pushd

 # pushdで同じディレクトリを重複してpushしない。
 setopt pushd_ignore_dups

alias ls="ls --color"
alias ll="ls -alF --color"
alias more="less '-E -P?f--More-- (%pb\%):--More--.'"
alias start='cygstart'
#alias gvim='C:/Users/horie/Documents/tool/vim73-kaoriya-win64/gvim.exe' $(cygpath -aw $*) &
alias gvim='/cygdrive/c/Users/horie/Documents/tool/vim73-kaoriya-win64/gvim.exe'
export EDITOR=vim
export GREP_OPTIONS="--color=auto"

case "${TERM}" in
kterm*|xterm*)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export ls3 件_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
cons25)
    unset LANG
    export ls3 件COLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac
