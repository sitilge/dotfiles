#!/bin/bash

# The plugin repos
repos=(
'https://github.com/scrooloose/nerdtree'
'https://github.com/vim-syntastic/syntastic'
'https://github.com/majutsushi/tagbar'
'https://github.com/vim-airline/vim-airline'
'https://github.com/vim-airline/vim-airline-themes'
'https://github.com/altercation/vim-colors-solarized'
'https://github.com/xolox/vim-easytags'
'https://github.com/airblade/vim-gitgutter'
'https://github.com/xolox/vim-misc'
'https://github.com/tpope/vim-sensible'
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
            echo "-i, --install    Install the pathogen and clone the repos"
            echo "-u, --update     Update by pulling the repos"

            exit
            ;;
    esac
done
