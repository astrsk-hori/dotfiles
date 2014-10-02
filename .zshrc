# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="muse"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
PATH=$PATH:/Applications/Lynxlet.app/Contents/Resources/lynx/bin

plugins=(git history history-substring-search mysql ruby rails gem brew rake rbenv autojump)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
show_buffer_stack() {
  POSTDISPLAY="
  stack: $LBUFFER"
    zle push-line-or-edit
}
zle -N show_buffer_stack
setopt noflowcontrol
bindkey '^Q' show_buffer_stack

#alias
#alias ctags='/opt/local/bin/ctags'
alias rtags='ctags --langmap=RUBY:.rb --exclude="*.js"  --exclude=".git*" -R . $(bundle list --paths)'

#ruby
#export RBENV_ROOT=$HOME/.rbenv
#export PATH="$RBENV_ROOT/shims:$RBENV_ROOT/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
#alias re='rbenv exec'

#shhet
export EDITOR=vim
# sheet
compdef _sheets sheet
function _sheets {
    local -a cmds
    _files -W ~/.sheets/ -P '~/.sheets/'

    cmds=('list' 'edit' 'copy')
    _describe -t commands "subcommand" cmds

    return 1;
}

# zsh-syntax-highlightingを使う
source ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.zshrc.peco ] && source ~/.zshrc.peco

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
