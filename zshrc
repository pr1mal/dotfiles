# Aliases
alias v='less'
alias ls='gls --color'
alias dircolors='gdircolors'
alias find='gfind'

# Path to your oh-my-zsh configuration.
ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="mh"
export ZSH_THEME="kennethreitz"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow brew common-aliases docker docker-compose marked 1password node npm themes zsh-dircolors-solarized)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source ~/.profile

export EDITOR=vim

# I don't want shared history
unsetopt share_history

# move /usr/local/bin to the very beginning
export PATH=$(echo $PATH | sed 's#^\(.*\)\(/usr/local/bin:\)\(.*\)#\2\1\3#')

export PATH="/usr/local/sbin:$PATH"

export PATH="/usr/local/opt/ruby/bin:$PATH"
