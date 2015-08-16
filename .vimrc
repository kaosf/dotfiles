"--- NeoBundle configurations --------------------------------------------------
"--- ref. https://github.com/Shougo/neobundle.vim#if-you-want-to-install-manually-or-you-are-using-windows

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

"------- My Bundles ------------------------------------------------------------
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'tpope/vim-rails'
NeoBundle 'rhysd/neco-ruby-keyword-args'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'vim-scripts/groovy.vim'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'dag/vim2hs'

" ref. http://d.hatena.ne.jp/osyo-manga/20130311/1363012363
NeoBundle 'thinca/vim-quickrun'

" For gist
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'

" ref. http://qiita.com/PSP_T/items/3a1af1301ee197b32a8a
NeoBundle 'osyo-manga/vim-over'

" ref. https://github.com/heavenshell
NeoBundle 'kaosf/vim-sudden-death', {'rev': 'remove-linebreaks'}

" ref.
"   https://github.com/tpope/vim-surround
"   http://blog.nico0927.net/20110115/vim/152
"   http://rcmdnk.github.io/blog/2014/05/03/computer-vim-octopress/
NeoBundle 'tpope/vim-surround'

" ref. https://github.com/Shougo/vimproc.vim#neobundle
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'Shougo/unite.vim'

NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'

NeoBundle 'scrooloose/nerdtree'

" ref. http://d.hatena.ne.jp/thinca/20120915/1347696749
NeoBundle 'thinca/vim-ft-clojure'
"NeoBundle 'tpope/vim-fireplace'

NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'kana/vim-altercmd'
NeoBundle 'vim-scripts/bufkill.vim'

NeoBundle 'tpope/vim-fugitive'

" MRU (Most Recently Used)
" ref. http://nanasi.jp/articles/vim/mru_vim.html
"NeoBundle 'vim-scripts/mru.vim'
NeoBundle 'kaosf/mru.vim' " Forked for my own remappings

" Disable this plugin now because it takes too long time.
"NeoBundle 'joker1007/vim-markdown-quote-syntax'

NeoBundle 'rhysd/committia.vim'

NeoBundle 'Kocha/vim-unite-tig'

NeoBundle 'thinca/vim-ref'

NeoBundle 'suan/vim-instant-markdown'

" ref. https://github.com/haya14busa/vim-undoreplay
NeoBundle 'haya14busa/vim-undoreplay'

" Disable this plugin now because of an error below.
"
" Error detected while processing
" /home/username/.vim/bundle/ruby_hl_lvar.vim/autoload/ruby_hl_lvar.vim:
" line    3:
" LoadError: no such file to load -- ripper
"NeoBundle 'todesking/ruby_hl_lvar.vim'

NeoBundle 'tpope/vim-dispatch'
NeoBundle 'thoughtbot/vim-rspec'
"NeoBundleLazy 'thoughtbot/vim-rspec', {
"                \ 'depends'  : 'tpope/vim-dispatch',
"                \ 'autoload' : { 'filetypes' : ['ruby'] }
"              \ }

NeoBundle 'elixir-lang/vim-elixir'

if filereadable($HOME . "/.vimrc-neobundle-local")
  source ~/.vimrc-neobundle-local
endif
"------- My Bundles END --------------------------------------------------------

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"--- NeoBundle configurations END ----------------------------------------------

"--- My configurations (until the tail) ----------------------------------------

set t_Co=256

let g:mapleader = ","

if filereadable($HOME . "/.vimrc-neocomplete")
  source ~/.vimrc-neocomplete
endif
if filereadable($HOME . "/.vimrc-neosnippet")
  source ~/.vimrc-neosnippet
endif

"" vimshell
" Use VimShellPop rather than VimShell
command VSH VimShellPop
command Vsh VimShellPop
nnoremap <silent> <leader>vs :VimShellPop<CR>
" Open Leiningen REPL or Rails console by "iexe lein repl" or "iexe rails c".
" Select lines in visual mode and then press ,s to run the selected code.
vmap <silent> <leader>s :VimShellSendString<cr>

"" vimfiler
" ref. https://github.com/mizoki/dotfiles/blob/42c377ed5e003ac921f1874c5a62d04f8cf5301e/.vimrc#L675-L686
" Set vimfiler to default explorer
let g:vimfiler_as_default_explorer = 1
" Enable file operation commands
let g:vimfiler_safe_mode_by_default = 0
" Show cursor line only in vimfiler buffer
autocmd filetype vimfiler setlocal cursorline

"" NERDTree
" ref. http://vim.1045645.n5.nabble.com/NERDTree-plugin-side-bar-width-td3747483.html
let g:NERDTreeWinSize=20
" Show hidden files
let NERDTreeShowHidden=1
" Shortcut for NERDTree command
nnoremap <silent> <leader>f :NERDTreeFocus<CR>

" Enable to move freely
" ref.
"   :help virtualedit
"   http://qiita.com/ka_/items/8e7a5e681db857b2ee26#comment-8d7a434b595f023cd12c
set virtualedit=all

" Enhance cursor speed
set nowrap
" ref. https://twitter.com/igrep/status/619387078858530816
" ref. http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
autocmd FileType ruby set re=1

" Make backspace key freely
" ref. http://qiita.com/omega999/items/23aec6a7f6d6735d033f
set backspace=indent,eol,start

" ref. http://vim.sourceforge.net/scripts/script.php?script_id=2175
syntax on

" ref. https://github.com/sue445/dotfiles/blob/d1251d6fe2effe72d385bb90d4409fe19f4ee006/_vimrc#L42
filetype indent on

" Disable backup
set nobk
set noswf

" ref. http://itcweb.cc.affrc.go.jp/affrit/faq/tips/vim-enc
set fileencodings=utf-8,utf-16le,sjis,euc-jp,iso-2022-jp
set fileformats=unix,mac,dos

" ref. https://github.com/alwei/dotfiles/blob/master/.gvimrc#L14
"  t_vb=  makes vim not to flash
set visualbell t_vb=

set encoding=utf-8

" Make not to have to press "Shift+;" to switch to command mode
nnoremap ; :
nnoremap : ;

" Switch tabs easily
nnoremap gh :bp<CR>
nnoremap gl :bn<CR>

" forgot where I did copy&paste from
set list
" set listchars=tab:>.
" set lcs=tab:>.,eol:$,trail:_,extends:\
set lcs=tab:>.,trail:_,extends:\
" set tabstop=4
set tabstop=2

" forgot where I did copy&paste from
set statusline=%t%m%=%y\[%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%03l,%03v][%2p%%]
set laststatus=2

" ref. http://labs.timedia.co.jp/2011/04/9-points-to-customize-automatic-indentation-in-vim.html
set autoindent
" set expandtab
set et " it's same as 'set expandtab'
" set noet " it's same as 'set noexpandtab' to disable expandtab

" ref. http://qiita.com/items/56f6363fdaf5e9e8a3a4
set hlsearch

" ref. http://vimblog.hatenablog.com/entry/vimrc_set_cursor_movement_options
" ref. https://twitter.com/ggkuron/status/375226033756061697
set scrolloff=4
set sidescroll=1
"set sidescrolloff=16 " This is my favorite sidescrolloff configuration,
set sidescrolloff=0   " but now set it to 0 for vimshell buffer.

" ref. https://github.com/rhysd/dotfiles/blob/7faa1e5b83788bdc8b67462e23479cc285b8ab6b/vimrc#L200-201
nnoremap <silent><expr>m "i".nr2char(getchar())."\<Esc>"

" ref. https://github.com/rhysd/dotfiles/blob/7faa1e5b83788bdc8b67462e23479cc285b8ab6b/vimrc#L204-205
nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap <silent>ff :<C-u>nohlsearch<CR>

" Exit insert mode by "kk" or "jj"
" ref. https://twitter.com/anekos/status/485416150541402112
inoremap kk <Esc>
inoremap jj <Esc>

" pair close checker.
" from othree vimrc ( http://github.com/othree/rc/blob/master/osx/.vimrc )
function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

" Clojure configurations
" ref. for "set lisp" https://bbs.archlinux.org/viewtopic.php?id=91335
autocmd FileType clojure set lisp
function! s:autocomplete_brackets()
  inoremap ( ()<Esc>i
  inoremap <expr> ) ClosePair(')')
  inoremap [ []<Esc>i
  inoremap <expr> ] ClosePair(']')
  inoremap { {}<Esc>i
  inoremap <expr> } ClosePair('}')
endfunction
autocmd FileType clojure :call <SID>autocomplete_brackets()

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap gy %
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k
vnoremap ff <Esc>

" Modify window size by cursor keys
nnoremap <Left>  <C-w><
nnoremap <Right> <C-w>>
nnoremap <Down>  <C-w>+
nnoremap <Up>    <C-w>-

" Use g] mainly for tag jump
nnoremap <C-]>  g<C-]>
nnoremap g<C-]> <C-]>

" Enable to move cursor in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>

if !has('mac')
  " collaboration with clipboard
  " ref. http://mba-hack.blogspot.jp/2013/02/clipboard.html
  set clipboard=unnamedplus
endif

" don't expand tabs when editing
"   Go
"   Python
"   Makefile
" source files
autocmd FileType go set noexpandtab
autocmd FileType python set noexpandtab
autocmd FileType make set noexpandtab

" autocomplete end tags of HTML and XML
" ref. https://github.com/sue445/dotfiles/blob/d1251d6fe2effe72d385bb90d4409fe19f4ee006/_vimrc#L90-L95
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" ref. https://github.com/vim-scripts/groovy.vim/blob/0.1.9b/syntax/groovy.vim#L24-27
au BufNewFile,BufRead *.gradle setf groovy

" *last-position-jump*
" ref. http://vimdoc.sourceforge.net/htmldoc/eval.html#last-position-jump
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"""" vim-indent-guides configurations
" ref.
"   https://github.com/nathanaelkane/vim-indent-guides
"   http://www.camelstudio.jp/note/vim/186/
"   http://room6933.com/blog/2011/11/30/vimrc_for_python/
" ref. of colorcode
"   http://h2plus.biz/hiromitsu/entry/674
set shiftwidth=2
colorscheme default
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1
let g:indent_guides_exclude_filetypes=['text', 'help', 'clojure', 'nerdtree', 'vimfiler', 'vimshell']
hi IndentGuidesOdd  ctermbg=237 guibg=cyan
hi IndentGuidesEven ctermbg=236 guibg=blue

"""" show a vertical line on column 81
" ref.
"   http://blog.hanschen.org/2012/10/24/different-background-color-in-vim-past-80-columns/
"   http://stackoverflow.com/questions/2447109/showing-a-different-background-colour-in-vim-past-80-characters
"   http://vim-users.jp/2011/05/hack217/
if exists('&colorcolumn')
  set colorcolumn=81
  hi ColorColumn ctermbg=0
endif

"""" vim-quickrun
" Split horizontally always
" ref. http://miniman2011.blog55.fc2.com/blog-entry-293.html
let g:quickrun_config={'*': {'split': ''}}

" post gist private by default (for safety)
let g:gist_post_private = 1
" only :w! updates a gist
" ref. http://d.hatena.ne.jp/tyru/20130113/gist_update_on_write
let g:gist_update_on_write = 2
command Gistlist Gist -l

" @ggkuron taught me
" open *.md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Swap BD (kill buffer but don't close the window) and bd (default)
" ref.
"   https://github.com/kana/vim-altercmd/
"   https://github.com/vim-scripts/bufkill.vim
"   http://qiita.com/kentaro/items/c3f7fc1d1be0e106735b
"   https://gist.github.com/LeafCage/4085361
try
  call altercmd#load()
  AlterCommand bd BD
  AlterCommand BD bd
catch
  echo 'Run ":NeoBundleInstall" to "altercmd#load"'
endtry

" Enable to change buffers quickly
" ref. http://kaworu.jpn.org/kaworu/2007-07-26-1.php
nnoremap gbf :ls<CR>:buf 

" Enable to move between `do` and `end`, `def` and `end` or etc by `%`.
" ref. http://qiita.com/alpaca_taichou/items/ab2ad83ddbaf2f6ce7fb
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

"let g:ruby_hl_lvar_show_warnings = 1

" vim-fugivie configurations
" ref.
"   multiple commands
"     http://vim.wikia.com/wiki/Multiple_commands_at_once
"   silent and redraw!
"     http://stackoverflow.com/questions/890802/how-do-i-disable-the-press-enter-or-type-command-to-continue-prompt-in-vim
"   args, f-args and q-args
"     http://stackoverflow.com/questions/3878692/aliasing-a-command-in-vim
"     http://vimdoc.sourceforge.net/htmldoc/map.html#%3Cf-args%3E
"     http://stackoverflow.com/questions/25057287/passing-and-using-arguments-to-command-in-vim-script
"     http://stackoverflow.com/questions/5642341/is-it-possible-to-use-multiple-arguments-in-vim-command
command Gshow Git show | redraw!
command Gada wa | silent Git add -A :/ | redraw!
command Gad w | silent exe "Git add " . @% | redraw!
command -nargs=* Gci Gcommit <args>
command Gac wa | silent Git add -A :/ | Gcommit
command Gaca wa | silent Git add -A :/ | Gcommit --amend
"command Gacarbh1cdiad wa | silent Git add -A :/ | silent Gcommit --amend | silent Git rebase HEAD^ --committer-date-is-author-date | redraw!
command Gacarbh1cdiad wa | silent Git add -A :/ | silent Git commit --amend | silent Git rebase HEAD^ --committer-date-is-author-date | redraw!
"command Gacarbh1id wa | silent Git add -A :/ | silent Gcommit --amend | silent Git rebase HEAD^ --ignore-date | redraw!
command Gacarbh1id wa | silent Git add -A :/ | silent Git commit --amend | silent Git rebase HEAD^ --ignore-date | redraw!
command Gnow wa | silent Git add -A :/ | Gcommit -m "[WIP]"
command Grbh1id silent Git rebase HEAD^ --ignore-date | redraw!
command Grbh1cdiad silent Git rebase HEAD^ --committer-date-is-author-date | redraw!
command Gdf Gvdiff
command -nargs=* Gco silent Git checkout <args> | redraw! | e!
command -nargs=* Gbr Git branch <args> | redraw!
command Grhh silent Git reset HEAD --hard | redraw! | e!
command Grh1h silent Git reset HEAD^ --hard | redraw! | e!
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gc :Gcommit<CR>

" vimdiff color
" ref.
"   http://qiita.com/takaakikasai/items/b46a0b8c94e476e57e31
"   http://d.hatena.ne.jp/acotie/20090707/1246969274
" Run on Vim to check color name;
"   :runtime syntax/colortest.vim
highlight DiffAdd    cterm=bold ctermfg=green ctermbg=black
highlight DiffDelete cterm=bold ctermfg=red   ctermbg=black
highlight DiffChange cterm=bold ctermfg=white ctermbg=black
highlight DiffText   cterm=bold ctermfg=white ctermbg=yellow

command Utig Unite tig

" Command for "Where is This file?"
command WT echo @%

command Swrap set wrap
command Snwrap set nowrap

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif
" ref. http://nanasi.jp/articles/howto/diff/diff-original-file.html
" Copy from $PREFIX/share/vim/vim74/vimrc_example.vim

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

"""" vim-ref
" NOTE: Want to get ref_refe_cmd value dynamically.
let g:ref_refe_cmd=$HOME.'/.rbenv/shims/refe'
" Commands to setup
"   gem install refe2
"   rbenv rehash
"   bitclust setup
" ref. http://qiita.com/masa2sei/items/85a2c2cc3721c79a5322

"""" vim-instant-markdown
" Commands to setup
"   gem install redcarpet pygments.rb
"   npm -g install instant-markdown-d
" ref. http://slowquery.hatenablog.com/entry/2013/03/25/214325
let g:instant_markdown_autostart = 0
" Command to launch browser
"   :InstantMarkdownPreview
" ref. https://github.com/suan/vim-instant-markdown

"""" vim.mru
nnoremap <leader>m :Mru<CR>
" ref.
"   https://github.com/yegappan/mru/blob/6e6064a087e73d6376962a1b05382b6dc72f7048/plugin/mru.vim
let MRU_Max_Entries = 5000
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*\|^.*/\.git/.*'
let MRU_Window_Height = 15

"""" vim-dispatch and vim-rspec
let g:rspec_command = "Dispatch rspec {spec}"
"let s:bundle = neobundle#get('vim-rspec')
"function! s:bundle.hooks.on_source(bundle)
"  let g:rspec_command = 'Dispatch rspec {spec}'
"endfunction
nnoremap <leader>sc :call RunCurrentSpecFile()<CR>
nnoremap <leader>sn :call RunNearestSpec()<CR>
nnoremap <leader>sl :call RunLastSpec()<CR>
nnoremap <leader>sa :call RunAllSpecs()<CR>

if filereadable($HOME . "/.vimrc-local")
  source ~/.vimrc-local
endif
