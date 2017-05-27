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

" Set the colorscheme
set background=dark
" Fallback for terminal mode
let g:solarized_termcolors=256
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

" Extra column for syntastic and git-gutter
hi clear SignColumn

" Set some fancy sytastic symbols
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol="▲"

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
" Open tagbar automatically whenever possible
autocmd BufEnter * nested :call tagbar#autoopen(0)

" Initial gitgutter config
" Refresh every 250ms
set updatetime=250