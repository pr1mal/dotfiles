# Aliases
#alias find='/usr/local/bin/gfind'
#alias xargs='/usr/local/bin/gxargs'
#alias ls='/usr/local/bin/gls --color=auto'
#alias l='ls -l'
#alias la='ls -la'
#alias gitaddall="git status | grep 'modified:' | cut -d' ' -f4 | xargs git add"

# Functions

function dircmp () {
	if [[ "$1" == "--help" || "$1" == "-h" ]]; then
		echo "Usage:"
		echo "$(basename $0) path/to/new_dir path_to/old_dir"
		return 0
	fi
	dir1=$1
	dir2=$2
	diff -rq $dir1 $dir2 | \
	while read line; do \
		case $line in \
			Files*) \
				cmd=`echo $line | sed 's#^Files \(.*\) and \(.*\) differ$#diff -u \2 \1#g'` ; \
				eval $cmd \
				;; \
			*) \
				echo $line \
				;; \
		esac ; \
	done | view "+set syntax=diff" -	
}

# move SRC file to DEST and create a symlink named SRC pointing to DEST
# DEST can be either file or directory, while moving, starting dot in filename is removed,
# but it's still kept in symlink name. Example:
# $ mvln ~/.zshrc ~/projects/dotfiles/
# $ ls -l .zshrc
# lrwxr-xr-x 1 evgenysokolov staff 30 Jul 19 15:16 .zshrc -> projects/dotfiles/zshrc
function mvln () {
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


