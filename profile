# Aliases
alias find='/usr/local/bin/gfind'
alias xargs='/usr/local/bin/gxargs'
alias ls='/usr/local/bin/gls --color=auto'
alias l='ls -l'
alias la='ls -la'
alias webui="cd ~/Projects/netmri.git/NetworkAutomation-rails"
alias gitaddall="git status | grep 'modified:' | cut -d' ' -f4 | xargs git add"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

