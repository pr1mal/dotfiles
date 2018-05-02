# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="mh"
export ZSH_THEME="avit"

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
plugins=(git brew p4 emacs common-aliases)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

alias v='less'
unalias ls
alias ls='gls --color'

export EDITOR=vim

# I don't want shared history
unsetopt share_history

# removes specified line from ~/.ssh/known_hosts
function rm_known_host() {
    sed -e "$1d" -i.bak ~/.ssh/known_hosts
}

export PATH="$HOME/.gem/ruby/2.0.0/bin:/usr/local/mysql/bin:$PATH"

# move /usr/local/bin to the very beginning
export PATH=$(echo $PATH | sed 's#^\(.*\)\(/usr/local/bin:\)\(.*\)#\2\1\3#')

# commented this out due to RVM complains
# export GEM_HOME=$HOME/.gem/ruby/2.0.0

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

PATH="/Users/evgenysokolov/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/evgenysokolov/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/evgenysokolov/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/evgenysokolov/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/evgenysokolov/perl5"; export PERL_MM_OPT;
