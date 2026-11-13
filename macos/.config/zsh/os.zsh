# macOS-only shell settings, sourced by ~/.zshrc after oh-my-zsh.
# The Linux counterpart is linux/.config/zsh/os.zsh in the dotfiles repo.
# vim: ft=zsh:ts=2:sw=2

# GNU coreutils from Homebrew (gls, gdircolors)
test -r ~/.dir_colors && eval $(gdircolors ~/.dir_colors)
alias ls='gls --color=auto'

# Google Cloud SDK
if [ -f "$HOME/work/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/work/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/work/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/work/google-cloud-sdk/completion.zsh.inc"; fi

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 11`
alias java-11='export JAVA_HOME=`/usr/libexec/java_home -v 11`'
alias java-21='export JAVA_HOME=`/usr/libexec/java_home -v 21`'

# Homebrew tools first on PATH: pyenv shims, GNU grep, postgres 12 client
export PATH="$(pyenv root)/shims:$PATH"
export PATH=/opt/homebrew/opt/grep/libexec/gnubin:$PATH
export PATH=/opt/homebrew/opt/postgresql@12/bin:$PATH
eval "$(/opt/homebrew/bin/mise activate)"

function marked() {
	help='
launch Marked in background, w/o blocking terminal
Usage: marked <markdown file>
'
	marked_bin="/Applications/Setapp/Marked.app"
	if [[ ! -d $marked_bin ]]; then
		echo 'install Marked from SetApp'
		return -1
	fi
	if [[ "$1" == "--help" || "$1" == "-h" ]]; then
		echo $help
		return 0
	fi
	file=$1
	[[ ! -f $file ]] && return -1
	open -a $marked_bin $file
}

## brew: list packages dependent on specified package
function brew_deps() {
	cask=$1
	[[ -z "$cask" ]] && return -1
	echo -ne "\x1B[1;34m $cask \x1B[0m"
	brew uses $cask --installed | awk '{printf(" %s ", $0)}'
}

function brew_all_deps() {
	if [[ ! -x $(which brew) ]]; then
		echo "no 'brew' executable found, exiting"
		return -1
	fi
	brew list -1 | while read cask; do
		brew_deps $cask
		echo ""
	done
}
