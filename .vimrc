colorscheme molokai
" en#runtime_append_all_bundles()
call pathogen#helptags()

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C>      "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>       "+gP
map <S-Insert>  "+gP

cmap <C-V>        <C-R>+
cmap <S-Insert>   <C-R>+

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

" Kill arrows :)
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

function! ToggleBackground()
    if (g:solarized_style=="dark")
        let g:solarized_style="light"
    colorscheme solarized
else
    let g:solarized_style="dark"
    colorscheme solarized
endif
endfunction
command! Togbg call ToggleBackground()
nnoremap <F5> :call ToggleBackground()<CR>
inoremap <F5> <ESC>:call ToggleBackground()<CR>a
vnoremap <F5> <ESC>:call ToggleBackground()<CR>

" Python
autocmd BufRead *.py set cinwords=if,elif,else,for,while,try,except,finally,def,class,from
autocmd BufRead *.py set expandtab
autocmd BufRead *.py set softtabstop=4

autocmd BufRead *.py highlight OverLength ctermbg=red ctermfg=white guibg=#7a7a7a
autocmd BufRead *.py match OverLength /\%79v.\+/

let mapleader = "," " change the mapleader from \ to ,
let python_highlight_all = 1

set expandtab
set autoindent " always set autoindenting on
"" set copyindent " copy the previous indentation on autoindenting
set tabstop=4 " a tab is four spaces
set shiftwidth=4
"set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
"set ignorecase " ignore case when searching
"set smartcase " ignore case if search pattern is all lowercase,
              "" case-sensitive otherwise
set smarttab " insert tabs on the start of a line according to
             "" shiftwidth, not tabstop
"set incsearch " show search matches as you type
"set backspace=indent,eol,start " allow backspacing over everything in insert mode
"set showmatch
"set hidden
set history=1000
set undolevels=1000 " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title " change the terminal's title
"set clipboard+=unnamed
set number ruler
set hlsearch
"set cursorline
set encoding=utf8
set fileencoding=utf8
"set smartcase
set list listchars=tab:»·,trail:·,eol:¬

set nobackup " no backup file
set noswapfile " no swap

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
    set guioptions-=r
    set guioptions-=L
    set gfn=Liberation\ Mono\ Regular:h15
    let g:obviousModeInsertHi = "guibg=Black guifg=White"
else
    let g:obviousModeInsertHi = "ctermfg=253 ctermbg=16"
endif

if has('autocmd')
    autocmd filetype html,xml set listchars-=tab:>.
endif

" strip whitespace after save
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" but only python and javascript files
autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()

filetype plugin indent on
