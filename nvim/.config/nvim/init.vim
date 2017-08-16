" Turn on filetype plugins
filetype plugin indent on

" Enable syntax highlight
syntax enable

" Set autoindent
set autoindent

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

" Highlight line under cursor
set cursorline

" Enable lazyredraw
set lazyredraw

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

" Always use the clipboard for all operations
set clipboard=unnamed,unnamedplus

" Show existing tab with 4 spaces width
set tabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" Set the background
set background=dark

" Enable faster navigation
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
nmap <silent> <A-;> gT
nmap <silent> <A-'> gt

" Enable mouse for navigation (don'y yell at me)
set mouse=a

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

" Open NERDTree automatically if dir selected
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Show hidden files
let NERDTreeShowHidden=1

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

" Enable deoplete on startup
let g:deoplete#enable_at_startup=1

" Deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Initial gitgutter config
set updatetime=1000

" Enable autosave
let g:auto_save=1
let g:auto_save_silent=1
let g:auto_save_write_all_buffers=1
let g:auto_updatetime=1000

" Run Neoformat after each save
let g:auto_save_postsave_hook='Neoformat'

" Enable basic formating when filetype not found
let g:neoformat_basic_format_align=1
let g:neoformat_basic_format_trim=1
