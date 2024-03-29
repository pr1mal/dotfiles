#!/bin/bash
# vim ft=bash:ts=2:sw=2

# Aliases
#alias find='/usr/local/bin/gfind'
#alias xargs='/usr/local/bin/gxargs'
#alias l='ls -l'
#alias la='ls -la'
#alias gitaddall="git status | grep 'modified:' | cut -d' ' -f4 | xargs git add"

# Set up dircolors and use GNU ls
test -r ~/.dir_colors && eval $(gdircolors ~/.dir_colors)
alias ls='gls --color=auto'

# default editor
export EDITOR=nvim
alias vim=nvim

# Functions
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

function dircmp() {
	if [[ "$1" == "--help" || "$1" == "-h" ]]; then
		echo "Usage:"
		echo "$(basename $0) path/to/new_dir path_to/old_dir"
		return 0
	fi
	dir1=$1
	dir2=$2
	diff -rq $dir1 $dir2 |
		while read line; do
			case $line in
			Files*)
				cmd=$(echo $line | sed 's#^Files \(.*\) and \(.*\) differ$#diff -u \2 \1#g')
				eval $cmd
				;;
			*)
				echo $line
				;;
			esac
		done | nvim -dR -
}

function mvln() {
	HELP='
Usage: mvln <SRC> <DEST>

Move SRC file to DEST and create a symlink named SRC pointing to DEST, DEST can be
either file or directory. While moving, starting dot in filename is removed, but
it is still kept in symlink name.

Example:
$ mvln ~/.zshrc ~/projects/dotfiles/
$ ls -l .zshrc
lrwxr-xr-x 1 evgenysokolov staff 30 Jul 19 15:16 .zshrc -> projects/dotfiles/zshrc
'
	[ -z "$1" -o -z "$2" ] && echo $HELP && return -1
	src=$1
	file=$(basename $src)
	dest=$2
	if [[ -r $src ]]; then
		[[ -d $dest ]] && dest=$dest/${file#.}
		mv $src $dest
		ln -s $dest $src
	fi
}

# removes specified line from ~/.ssh/known_hosts
function rm_known_host() {
	sed -e "$1d" -i.bak ~/.ssh/known_hosts
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
