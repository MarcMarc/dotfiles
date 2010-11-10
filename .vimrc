colorscheme molokai
let g:molokai_original = 0

filetype off

call pathogen#runtime_append_all_bundles()

set history=1000

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

" Kill arrows :)
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

let mapleader = ","

set nobackup
set noswapfile
set pastetoggle=<F2>

" set bg=dark
" let g:zenburn_high_Contrast = 1
" set t_Co=256

let python_highlight_all = 1

if has("gui_running")
    " No menus and no toolbar
    set guioptions-=m
    set guioptions-=T
    set gfn=Liberation\ Mono\ 10
    let g:obviousModeInsertHi = "guibg=Black guifg=White"
else
    let g:obviousModeInsertHi = "ctermfg=253 ctermbg=16"
endif

set list listchars=tab:»·,trail:·,eol:¬
" Python
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,from
autocmd BufRead *.py set tabstop=4
autocmd BufRead *.py set shiftwidth=4
autocmd BufRead *.py set smarttab
autocmd BufRead *.py set expandtab
autocmd BufRead *.py set softtabstop=4
autocmd BufRead *.py set autoindent

set showmatch
set clipboard+=unnamed
set number ruler
set hlsearch
set cursorline
set encoding=utf8
set fileencoding=utf8
set smartcase

" NERDTree
noremap <C-E> :NERDTree<CR>

let NERDTreeShowBookmarks = 1
let NERDTreeIgnore=['\.pyo', '\.pyc']

" no beep
autocmd VimEnter * set vb t_vb= 

" tab navigation like firefox
nmap <C-S-tab> :tabprevious<cr>
nmap <C-tab> :tabnext<cr>

map <C-S-tab> :tabprevious<cr>
map <C-tab> :tabnext<cr>

imap <C-S-tab> <ESC>:tabprevious<cr>i
imap <C-tab> <ESC>:tabnext<cr>i

nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr> 
" map \tx for the console version as well
if !has("gui_running")
    nmap <Leader>tn :tabnext<cr>
    nmap <Leader>tp :tabprevious<cr>
    nmap <Leader><F4> :tabclose<cr>
end

filetype plugin on
filetype indent on
