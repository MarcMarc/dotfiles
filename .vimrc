colorscheme molokai
let g:molokai_original = 0

filetype off

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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

" ;w for save and so on!
nnoremap ; :

" Python
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,from
autocmd BufRead *.py set expandtab
autocmd BufRead *.py set softtabstop=4

let mapleader = "," " change the mapleader from \ to ,
let python_highlight_all = 1

set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting
set tabstop=4 " a tab is four spaces
set shiftwidth=4
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase,
              " case-sensitive otherwise
set smarttab " insert tabs on the start of a line according to
             " shiftwidth, not tabstop
set incsearch " show search matches as you type
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set showmatch
set hidden
set history=1000
set undolevels=1000 " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title " change the terminal's title
set clipboard+=unnamed
set number ruler
set hlsearch
set cursorline
set encoding=utf8
set fileencoding=utf8
set smartcase
set list listchars=tab:»·,trail:·,eol:¬

set nobackup " no backup file
set noswapfile " no swap

set pastetoggle=<F2> " 

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
if has("gui_running")
    " No menus and no toolbar
    set guioptions-=m
    set guioptions-=T
    set gfn=Liberation\ Mono\ 10
    let g:obviousModeInsertHi = "guibg=Black guifg=White"
else
    let g:obviousModeInsertHi = "ctermfg=253 ctermbg=16"
endif

if has('autocmd')
    autocmd filetype html,xml set listchars-=tab:>.
endif

filetype plugin indent on
