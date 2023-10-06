syntax on

set t_Co=256
set relativenumber
set showcmd
set virtualedit=all
set nowrap
set backspace=indent,eol,start
set nobk
set noswf
set fileencodings=utf-8,sjis,utf-16le,euc-jp,iso-2022-jp
set fileformats=unix,mac,dos
set visualbell t_vb=
set encoding=utf-8
set list
set lcs=tab:>.,trail:_,extends:\
set tabstop=2
set autoindent
set expandtab
set hlsearch
set scrolloff=4
set sidescroll=1
set sidescrolloff=0
set shiftwidth=2
set statusline=%t%=%y\[%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%03l,%03v][%2p%%]%m

if !has('mac')
  " collaboration with clipboard
  " ref. http://mba-hack.blogspot.jp/2013/02/clipboard.html
  set clipboard=unnamedplus
endif

let g:mapleader = ","

filetype indent on

nnoremap ; :
nnoremap : ;
nnoremap ss :w<CR>
nnoremap sq :wq<CR>
nnoremap <silent> tc :tabnew<CR>
nnoremap <silent> tC :-tabnew<CR>
nnoremap <silent> t> :+tabmove<CR>
nnoremap <silent> t< :-tabmove<CR>
nnoremap <silent> t. :+tabmove<CR>
nnoremap <silent> t, :-tabmove<CR>
inoremap kk <Esc>
inoremap jj <Esc>
nnoremap <silent>ff :<C-u>nohlsearch<CR>
nnoremap j gj
nnoremap k gk
nnoremap gy %
vnoremap j gj
vnoremap k gk
vnoremap ff <Esc>
nnoremap <Left>  <C-w><
nnoremap <Right> <C-w>>
nnoremap <Down>  <C-w>+
nnoremap <Up>    <C-w>-
nnoremap K <Nop>
vnoremap K <Nop>
" Enable to move cursor in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>

" Easy window/tab change
nnoremap gp :bp<CR>
nnoremap gn :bn<CR>
nnoremap gj <C-w>j
nnoremap gk <C-w>k
function s:movewinleft()
  let before = winnr()
  wincmd h
  if before == winnr()
    tabprevious
  endif
endfunction
nnoremap <silent> gh :call <SID>movewinleft()<CR>
function s:movewinright()
  let before = winnr()
  wincmd l
  if before == winnr()
    tabnext
  endif
endfunction
nnoremap <silent> gl :call <SID>movewinright()<CR>

autocmd Filetype json setl conceallevel=0
autocmd Filetype markdown setl conceallevel=0
autocmd FileType go set noexpandtab
autocmd FileType make set noexpandtab
autocmd FileType python set shiftwidth=4
autocmd FileType groovy set shiftwidth=4
autocmd BufNewFile,BufRead *.gradle setf groovy

" *last-position-jump*
" ref. http://vimdoc.sourceforge.net/htmldoc/eval.html#last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Command for "Where is This file?"
command WT echo @%

" Easy wrap/unwrap switch
command Swrap set wrap
command Snwrap set nowrap

"""" Change directory to the current file's directory
" ref. http://qiita.com/shiena/items/1e98fd14d0ef0084b17f
command Cdf cd %:h

"""" MRU with vanilla
" ref. https://qiita.com/todashuta/items/1362654c6276e5b69abc
nnoremap <Leader>m :<C-u>/ oldfiles<Home>browse filter /

"""" Highlight zenkaku spaces
" ref. http://inari.hatenablog.com/entry/2014/05/05/231307
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=238 gui=reverse guifg=cyan
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

"""" Reload command
command Reload :source ~/.config/nvim/init.vim

"""" Plugin Manager **Dein**
if filereadable($HOME . "/.config/nvim/dein.vim")
  source ~/.config/nvim/dein.vim
endif

"""" Local configuration
if filereadable($HOME . "/.config/nvim/init-local.vim")
  source ~/.config/nvim/init-local.vim
endif
