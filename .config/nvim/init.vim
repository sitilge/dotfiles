" Set the encoding
set encoding=utf-8

" Auto-reload files
set autoread

" Show the ruler
set ruler

" Show line numbers
set number

" Show unfinished command
set showcmd

" Highlight search results
set hlsearch

" Enable syntax highlighting
syntax on

" Enable mouse interaction
set mouse=a

" Start pathogen plugin manager
execute pathogen#infect()

" Turn on filetype detection, load file plugin and file indent
filetype plugin indent on

" Always use the clipboard for all operations
set clipboard=unnamed,unnamedplus

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4

" Set the colorscheme
set background=dark
colorscheme solarized

" Upgrade airline
set laststatus=2
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1

" Set airline theme
let g:airline_theme='solarized'

" Open NERDTree automatically if a file is specified
autocmd vimenter * NERDTree

" Open NERDTree automatically if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close NERDTree if it is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Mapping alt+key for faster navigation
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Extra column for syntastic and git-gutter
hi clear SignColumn

" Initial syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Set syntastic checkers
autocmd FileType c let b:syntastic_checkers = findfile('.syntastic_c_config') != '' ? ['gcc'] : ['']
autocmd FileType c let b:syntastic_checkers = findfile('.syntastic_avrgcc_config') != '' ? ['avrgcc'] : ['']

" Initial easytags config
set tags=./tags;,~/.vimtags
let g:easytags_events=['BufReadPost', 'BufWritePost']
let g:easytags_async=1
let g:easytags_dynamic_files=2
let g:easytags_resolve_links=1
let g:easytags_suppress_ctags_warning=1

" Initial tagbar config
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>

" Initial gitgutter config
" Refresh every 250ms
set updatetime=250
