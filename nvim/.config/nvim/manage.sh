#!/bin/bash

# The plugin repos
repos=(
'https://github.com/scrooloose/nerdtree.git'
'https://github.com/scrooloose/nerdcommenter.git'
'https://github.com/jistr/vim-nerdtree-tabs.git'
'https://github.com/xuyuanp/nerdtree-git-plugin.git'
'https://github.com/vim-syntastic/syntastic.git'
'https://github.com/vim-airline/vim-airline.git'
'https://github.com/vim-airline/vim-airline-themes.git'
'https://github.com/altercation/vim-colors-solarized.git'
'https://github.com/airblade/vim-gitgutter.git'
'https://github.com/tpope/vim-sensible.git'
'https://github.com/Raimondi/delimitMate.git'
'https://github.com/ntpeters/vim-better-whitespace.git'
'https://github.com/wikitopian/hardmode.git'
'https://github.com/ryanoasis/vim-devicons.git'
'https://github.com/Shougo/deoplete.nvim.git'
'https://github.com/vim-scripts/vim-auto-save.git'
'https://github.com/sbdchd/neoformat'
)

# No config below this line
dir=~/.config/nvim

while true
do
	case "$1" in
		--init)
			cd "${dir}"/autoload

			curl -LSso pathogen.vim https://tpo.pe/pathogen.vim

			exit
			;;
		--install)
			cd "${dir}"/bundle

			for repo in "${repos[@]}"
			do
				git clone --depth=1 "${repo}"
			done

			exit
			;;
		--update)
			cd "${dir}"/bundle

			for repo in "${repos[@]}"
			do
				git pull
			done

			exit
			;;
		--purge)
			cd "${dir}"/bundle

			rd=()

			for repo in "${repos[@]}"
			do
				d=`echo "${repo}" | rev | cut -d '/' -f 1 | rev`
				rd+=("${d%.git}")
			done

			for d in *
			do
				if [[ "${rd[*]}" != *"${d}"* ]]
				then
					rm -R "${d}"
				fi
			done

			exit
			;;
		*)
			echo ""
			echo "Usage: manage.sh OPTION"
			echo ""
			echo "Options:"
			echo "--init        Initialize the plugin manager"
			echo "--install     Clone the repos"
			echo "--update      Pull the repos"
			echo "--purge       Purge the repos"

			exit
			;;
	esac
done
