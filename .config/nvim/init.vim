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

" Turn on filetype detection, load file plugin and file indent
filetype plugin indent on

" Always use the clipboard for all operations
set clipboard=unnamed,unnamedplus

" Show existing tab with 4 spaces width
set tabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" Override the default leader
let mapleader=","

" Set the background
set background=dark

" Set the colorscheme
colorscheme solarized

" Enable faster navigation
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>l :wincmd l<CR>
nmap <silent> <leader>; gT
nmap <silent> <leader>'' gt
nmap <silent> <leader>b :TagbarToggle<CR>

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Force saving files that require root permission
cnoremap w!! w !sudo tee > /dev/null %

" Start pathogen plugin manager
execute pathogen#infect()

" Upgrade airline
set laststatus=2
let g:airline_detect_paste=1
let g:airline_powerline_fonts=1

" Set airline theme
let g:airline_theme='solarized'

" Open NERDTree automatically if a file is specified
autocmd vimenter * NERDTree

" Open NERDTree automatically if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close NERDTree if it is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto-open on console vim startup
let g:nerdtree_tabs_open_on_console_startup=1

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
function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction

autocmd FileType c let b:syntastic_checkers = FindConfig('-c', '.syntastic_c_config', expand('<afile>:p:h', 1)) != '' ? ['gcc'] : ['']
autocmd FileType c let b:syntastic_checkers = FindConfig('-c', '.syntastic_avrgcc_config', expand('<afile>:p:h', 1)) != '' ? ['avrgcc'] : ['']

" Initial easytags config
set tags=~/.vimtags
let g:easytags_events=['BufReadPost', 'BufWritePost']
let g:easytags_async=1
let g:easytags_dynamic_files=2
let g:easytags_resolve_links=1
let g:easytags_suppress_ctags_warning=1

" Initial gitgutter config
" Refresh every 250ms
set updatetime=250

" Let the hard times roll
autocmd VimEnter,BufNewFile,BufReadPost * if !strlen(&buftype) | silent! call HardMode() | endif
