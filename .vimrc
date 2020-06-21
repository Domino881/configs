set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set tabstop=4
set shiftwidth=4

"********************MISCELLANEOUS********************
command Wq wq
command W w
command Q q

set hlsearch
set incsearch
set number relativenumber
let mapleader=" "
let maplocalleader=" "
set scrolloff=4
set nowrap
set splitright
set splitbelow

set ttimeoutlen=10
set timeoutlen=400
set laststatus=2
set noshowmode
set backspace=indent,eol,start
set termencoding=utf8
set encoding=utf8
set conceallevel=2

"folding
"augroup folding
  "au BufReadPre * setlocal foldmethod=syntax
  "au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
"augroup END
set foldmethod=syntax
nnoremap zf :setlocal foldmethod=manual<CR>zf
set foldlevel=9999 


set nobackup
set nowritebackup
set cmdheight=2
set updatetime=100
set shortmess+=c
set signcolumn=yes

if !isdirectory("/tmp/.vim-undo-dir")
	call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

if has('python3')
  silent! python3 1
endif

vnoremap < <gv
vnoremap > >gv

nnoremap <m-o> o<Esc>k

"use an interactive shell for :! (respect .bashrc)
set shellcmdflag=-ic

augroup inactivewin
	autocmd!
	autocmd WinEnter * set nu rnu
	autocmd WinLeave * set norelativenumber
augroup END

function _gd()
	try
		call CocAction('jumpDefinition')
	finally
		echo "coc failed"
		normal gD
endtry
endfunction

nmap gd :call _gd()<CR>
nnoremap K :YcmCompleter GetDoc<CR>

cnoremap <C-t> \| Files

" check highlight group of word under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

autocmd Filetype markdown inoremap <silent><F9> ![]()<Left><C-o>
					\:!chromium  https://www.codecogs.com/latex/eqneditor.php &<CR>
autocmd Filetype markdown nnoremap <silent><F9> :r !chromium https://www.codecogs.com/latex/eqneditor.php<CR><CR>

nnoremap ,t :tab sball<CR>
set t_ut=

if has("autocmd")
	  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

command Vimrc e! ~/.vimrc
set completeopt=menu,menuone,popup
"********************END MISCELLANEOUS********************

"********************LEADER MAPPINGS********************
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
nnoremap <silent><expr> <Leader>m (&mouse == "a" ? ':set mouse=<CR>:echo "mouse off"<CR>' : ':set mouse=a<CR>:echo "mouse on"<CR>')
nnoremap <Leader>n :set nu!<CR>:set rnu!<CR>


nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>e :pclose<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :so %<CR>
nnoremap <Leader>v :vspl 
nnoremap <Leader>b :spl 

nnoremap <Leader>t :bot term ++rows=12<CR>
tnoremap <Leader>t <C-d>

nnoremap <Leader>p "*p
nnoremap <Leader>P "*P
"********************LEADER MAPPINGS********************

"********************MOVEMENT MAPPINGS********************
"alt + hjkl
inoremap <m-h> <Left>
inoremap <m-j> <Down>
inoremap <m-k> <Up>
inoremap <m-l> <Right>
inoremap <m-o> <C-o>o

tnoremap <m-h> <Left>
tnoremap <m-j> <Down>
tnoremap <m-k> <Up>
tnoremap <m-l> <Right>
cnoremap <m-h> <Left>
cnoremap <m-j> <Down>
cnoremap <m-k> <Up>
cnoremap <m-l> <Right>

nnoremap <Leader>j 30j
nnoremap <Leader>k 30k

nnoremap <C-h> <C-w><Left>
nnoremap <C-j> <C-w><Down>
nnoremap <C-k> <C-w><Up>
nnoremap <C-l> <C-w><Right>
tnoremap <C-h> <C-w><Left>
tnoremap <C-j> <C-w><Down>
tnoremap <C-k> <C-w><Up>
tnoremap <C-l> <C-w><Right>

" nnoremap < <<
" nnoremap > >>

imap <C-e> <C-o><C-e>
imap <C-y> <C-o><C-y>
imap <C-d> <C-o><C-d>
imap <C-u> <C-o><C-u>
"********************END MOVEMENT MAPPINGS********************

"********************PYTHON********************
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match SpellBad /\s\+$/
"********************END PYTHON********************

"********************PLUGINS***********************
source ~/.vim/plugged/pluginconf.vim
set list lcs=tab:\│\ 
set fillchars+=vert:│
colorscheme kuczy
