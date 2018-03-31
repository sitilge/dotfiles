" Turn on filetype plugins
filetype plugin indent on

" Enable syntax highlight
syntax enable

" Enable true-color support
set termguicolors

" Set autoindent
set autoindent

" Set smartindent
set smartindent

" Always show window status
set laststatus=2

" Show line and column number
set ruler

" Show the nice autocomplete menu
set wildmenu

" Set enconding to utf-8
set encoding=utf-8

" Reload unchanged files automatically
set autoread

" Enable persistent undo
set undodir=~/.vimundo/
set undofile

" Highlight line under cursor
set cursorline

" Enable lazyredraw
set lazyredraw

" Enable mouse for navigation (don't yell at me)
set mouse=a

" Enable passive folding
set foldmethod=indent
set nofoldenable

" Fix 8 lines above the cursor
set scrolloff=8

" Set full autocompletion
set wildmode=longest,full

" Don't ignore case
set smartcase

" Auto-center on search result
noremap n nzz
noremap N Nzz

" Set window title
set title

" Show line numbers
set number

" Show unfinished command
set showcmd

" Highlight search results
set hlsearch

" Show existing tab with 8 spaces width
set tabstop=8

" When indenting with '>', use 8 spaces width
set shiftwidth=8

" Set the background
set background=dark

" Enable faster navigation
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
nmap <silent> <A-;> gT
nmap <silent> <A-'> gt

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Disable Arrow keys in Visual mode
vmap <up> <nop>
vmap <down> <nop>
vmap <left> <nop>
vmap <right> <nop>

" Force saving files that require root permission
cnoremap w!! w !sudo tee > /dev/null %

" Set a custom runtime path for pathogen
set rtp^=~/.config/nvim/autoload/

" Start pathogen plugin manager
execute pathogen#infect()
call pathogen#helptags()

" Set the colorscheme
colorscheme solarized

" Visually hide the annoying tilde signs
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

" Upgrade airline
let g:airline_detect_paste=1
let g:airline_powerline_fonts=1

" Set airline theme
let g:airline_theme='solarized'

" Start NERDTreeTabs on GUI if dir selected
let g:nerdtree_tabs_open_on_console_startup=2
let g:nerdtree_tabs_smart_startup_focus=2
let g:nerdtree_tabs_focus_on_files=1

" Show hidden files
let NERDTreeShowHidden=1

" Extra column for syntastic and git-gutter
hi clear SignColumn

" Initial syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Set syntastic checkers
function! FindConfig(prefix, what, where)
	let cfg = findfile(a:what, escape(a:where, ' ') . ';')
	return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction

autocmd FileType c let b:syntastic_checkers = FindConfig('-c', '.syntastic_c_config', expand('<afile>:p:h', 1)) != '' ? ['gcc'] : ['']
autocmd FileType c let b:syntastic_checkers = FindConfig('-c', '.syntastic_avrgcc_config', expand('<afile>:p:h', 1)) != '' ? ['avrgcc'] : ['']

" Enable deoplete on insert
autocmd InsertEnter * call deoplete#enable()

" Deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Initial gitgutter config
set updatetime=1000
