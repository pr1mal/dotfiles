# Linux-only shell settings, sourced by ~/.zshrc after oh-my-zsh.
# The macOS counterpart is macos/.config/zsh/os.zsh in the dotfiles repo.
# vim: ft=zsh:ts=2:sw=2

# GNU ls and dircolors are the system ones here (gls/gdircolors on the Mac)
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)
alias ls='ls --color=auto'

# Same commands as on the Mac
alias open='xdg-open'
alias pbcopy='wl-copy'
alias pbpaste='wl-paste'

# Debian/Ubuntu ship fd as "fdfind"
command -v fd >/dev/null || alias fd=fdfind

# Google Cloud SDK (snap)
if [ -f /snap/google-cloud-cli/current/completion.zsh.inc ]; then . /snap/google-cloud-cli/current/completion.zsh.inc; fi

# Java: OpenJDK from apt. The system `java` follows update-alternatives, so
# put the chosen JDK first on PATH to make `java` match JAVA_HOME (as on the Mac).
function use-java() {
  local home=/usr/lib/jvm/java-$1-openjdk-amd64
  [[ -d $home ]] || { echo "no JDK $1 in /usr/lib/jvm" >&2; return 1 }
  export JAVA_HOME=$home
  path=($JAVA_HOME/bin ${path:#/usr/lib/jvm/*})
}
alias java-11='use-java 11'
alias java-17='use-java 17'
alias java-21='use-java 21'
use-java 11

# mise / pyenv, when installed
command -v mise >/dev/null && eval "$(mise activate zsh)"
command -v pyenv >/dev/null && export PATH="$(pyenv root)/shims:$PATH"
