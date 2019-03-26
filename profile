# Aliases
#alias find='/usr/local/bin/gfind'
#alias xargs='/usr/local/bin/gxargs'
alias ls='/usr/local/bin/gls --color=auto'
#alias l='ls -l'
#alias la='ls -la'
alias gitaddall="git status | grep 'modified:' | cut -d' ' -f4 | xargs git add"


