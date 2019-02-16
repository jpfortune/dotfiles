call plug#begin('~/.vim/plugged')
Plug 'ambv/black'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'ludovicchabant/vim-gutentags'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nvie/vim-flake8'
Plug 'morhetz/gruvbox'
call plug#end()

set encoding=utf-8

" Black
autocmd BufWritePre *.py execute ':Black'

" colorscheme
colorscheme gruvbox
set background=dark

" key mappings
let mapleader=","
inoremap <C-d> import code; code.interact(local = locals())<ESC>
inoremap <C-e> import sys; sys.exit(0)<ESC>
inoremap <C-k> ("")<Left><Left>
inoremap <C-l> [""]<Left><Left> inoremap jk <ESC>
inoremap jk <ESC>
inoremap Jk <ESC>
inoremap JK <ESC>
noremap <S-r> :w<CR>:!%:p
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Whitespace
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set nosmartindent
set linespace=0
set nojoinspaces
set number

" speed
set ttyfast
set lazyredraw

set backspace=indent,eol,start
set laststatus=2

" multiple vim window nav "
noremap <C-j> <C-w>j<C-j>
noremap <C-k> <C-w>k<C-k>
noremap <C-l> <C-w>l<C-l>
noremap <C-h> <C-w>h<C-h>
set hlsearch!
nnoremap <F3> :set hlsearch!<CR>
set encoding=utf-8

" color
set t_Co=256

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#left_sep = '>'
let g:airline_theme='bubblegum'

" Resizing with Arrows
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" undo settings
set undofile
set undodir=~/.vim/undodir

set hlsearch
"hi Search cterm=NONE ctermfg=black ctermbg=white
"hi CursorLineNr cterm=None ctermfg=white ctermbg=black

highlight ExtraWhitespace ctermbg=red ctermfg=black guibg=lightgray guifg=black
match ExtraWhitespace /\s\+$/

"highlight OverLength ctermbg=lightgray ctermfg=black guibg=lightgray guifg=black
"2match OverLength /\%>80v.\+/

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Gutentags
" Don't load me if there's no ctags file
"if !executable('ctags')
"    let g:gutentags_dont_load = 1
"endif
