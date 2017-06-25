#!/bin/bash

# The plugin repos
repos=(
'https://github.com/scrooloose/nerdtree'
'https://github.com/scrooloose/nerdcommenter'
'https://github.com/jistr/vim-nerdtree-tabs.git'
'https://github.com/vim-syntastic/syntastic'
'https://github.com/vim-airline/vim-airline'
'https://github.com/vim-airline/vim-airline-themes'
'https://github.com/altercation/vim-colors-solarized'
'https://github.com/airblade/vim-gitgutter'
'https://github.com/tpope/vim-sensible'
'https://github.com/Raimondi/delimitMate'
'https://github.com/ntpeters/vim-better-whitespace'
'https://github.com/wikitopian/hardmode'
'https://github.com/ryanoasis/vim-devicons'
'https://github.com/Shougo/deoplete.nvim'
);

# No config below this line
dir=~/.config/nvim

while true; do
	case "$1" in
		-i|--install)
			cd ${dir}/autoload

			curl -LSso pathogen.vim https://tpo.pe/pathogen.vim

			cd ${dir}/bundle

			for repo in "${repos[@]}"
			do
				git clone --depth=1 ${repo}
			done

			exit
			;;
		-u|--update)
			for repo in "${repos[@]}"
			do
				echo "${repo} => `git pull`"
			done

			exit
			;;
		*)
			echo "Usage: manage.sh option"
			echo "Options:"
			echo "-i, --install	Install the pathogen and clone the repos"
			echo "-u, --update	 Update by pulling the repos"

			exit
			;;
	esac
done
