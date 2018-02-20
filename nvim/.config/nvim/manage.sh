#!/bin/sh

# The plugin repos
repos=(
'https://github.com/scrooloose/nerdtree.git'
'https://github.com/jistr/vim-nerdtree-tabs.git'
'https://github.com/xuyuanp/nerdtree-git-plugin.git'
'https://github.com/vim-syntastic/syntastic.git'
'https://github.com/vim-airline/vim-airline.git'
'https://github.com/vim-airline/vim-airline-themes.git'
'https://github.com/ericbn/vim-solarized.git'
'https://github.com/airblade/vim-gitgutter.git'
'https://github.com/ntpeters/vim-better-whitespace.git'
'https://github.com/ryanoasis/vim-devicons.git'
'https://github.com/Shougo/deoplete.nvim.git'
'https://github.com/907th/vim-auto-save.git'
'https://github.com/sbdchd/neoformat'
# 'https://github.com/universal-ctags/ctags.git'
# 'https://github.com/xolox/vim-misc.git'
# 'https://github.com/xolox/vim-easytags.git'
# 'https://github.com/majutsushi/tagbar.git'
'https://github.com/whatyouhide/vim-lengthmatters.git'
'https://github.com/mbbill/undotree.git'
'https://github.com/tpope/vim-repeat.git'
'https://github.com/tpope/vim-commentary.git'
'https://github.com/tpope/vim-fugitive.git'
'https://github.com/brooth/far.vim.git'
)

# The config directory
dir=~/.config/nvim

# No config below this line

hasElement() {
	local element

	for element in "${@:2}"
	do
		[[ "${element}" == "$1" ]] && return 0
	done

	return 1
}

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
				git submodule add "${repo}"
			done

			# Call nvim command to update the plugins
			nvim +UpdateRemotePlugins +qall

			exit
			;;
		--update)
			cd "${dir}"/bundle

			for repo in "${repos[@]}"
			do
				git pull
			done

			# Call nvim command to update the plugins
			nvim +UpdateRemotePlugins +qall

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
				hasElement "${d}" "${rd[@]}"
				if [[ $? -eq "1" ]]
				then
					rm -rf "${d}"
				fi
			done

			# Call nvim command to update the plugins
			nvim +UpdateRemotePlugins +qall

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
