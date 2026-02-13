set t_Co=256

set showcmd

let g:mapleader = ","

if has('gui_running')
  let g:deoplete#enable_at_startup = 0
else
  let g:deoplete#enable_at_startup = 1
endif
" ref. has('gui_running') http://vector.hateblo.jp/entry/20110918/1316363220

if filereadable($HOME . "/.vimrc-neosnippet")
  source ~/.vimrc-neosnippet
endif

"" vimshell
function s:launchvimshell()
  tabnew
  VimShell
endfunction
command VSH :call <SID>launchvimshell()
command Vsh :call <SID>launchvimshell()
nnoremap <silent> <leader>vs :call <SID>launchvimshell()<CR>
command VSC VimShellCreate
command Vsc VimShellCreate
" Open Leiningen REPL or Rails console by "iexe lein repl" or "iexe rails c".
" Select lines in visual mode and then press ,s to run the selected code.
vmap <silent> <leader>s :VimShellSendString<cr>

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
set fileencodings=utf-8,sjis,utf-16le,euc-jp,iso-2022-jp
set fileformats=unix,mac,dos

" ref. https://github.com/alwei/dotfiles/blob/master/.gvimrc#L14
"  t_vb=  makes vim not to flash
set visualbell t_vb=

set encoding=utf-8

" Make not to have to press "Shift+;" to switch to command mode
nnoremap ; :
nnoremap : ;
" Save or save and quit without Enter or Ctrl-j
nnoremap ss :w<CR>
nnoremap sq :wq<CR>

nnoremap sbd :bd<CR>

" Switch buffers easily
nnoremap gp :bp<CR>
nnoremap gn :bn<CR>
" Move windows easily
nnoremap gj <C-w>j
nnoremap gk <C-w>k
" Switch tabs by same key mappings for moving windows
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
" Create a new tab easily
nnoremap <silent> tc :tabnew<CR>
nnoremap <silent> tC :-tabnew<CR>
nnoremap <silent> t> :+tabmove<CR>
nnoremap <silent> t< :-tabmove<CR>
nnoremap <silent> t. :+tabmove<CR>
nnoremap <silent> t, :-tabmove<CR>

" forgot where I did copy&paste from
set list
" set listchars=tab:>.
" set lcs=tab:>.,eol:$,trail:_,extends:\
set lcs=tab:>.,trail:_,extends:\
" set tabstop=4
set tabstop=2

" forgot where I did copy&paste from
set statusline=%t%=%y\[%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%03l,%03v][%2p%%]%m
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

" ref. https://github.com/rhysd/dotfiles/blob/7faa1e5b83788bdc8b67462e23479cc285b8ab6b/vimrc#L204-205
nnoremap <silent>ff :<C-u>nohlsearch<CR>

" Exit insert mode by "kk" or "jj"
" ref. https://twitter.com/anekos/status/485416150541402112
inoremap kk <Esc>
inoremap jj <Esc>

"" Don't have to press Ctrl
"inoremap jw <C-w>
"inoremap jq <C-h>

" Press F10 in insert mode to prevent autoindent, unexpected imap or etc...
" ref.
"   :help pastetoggle
"   :help i_CTRL-O
"   http://twilog.org/ka_/date-160523
"   http://twilog.org/ka_/date-160524
"   https://twitter.com/koturn/status/734743215002255360
"   https://twitter.com/h_east/status/734760376504455168
inoremap <F10> <C-O>:set paste<CR>
set pastetoggle=<F10>
" Paste clipboard by C-v
inoremap <C-v> <C-r>+

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
nnoremap gy %
vnoremap j gj
vnoremap k gk
vnoremap ff <Esc>

" Modify window size by cursor keys
nnoremap <Left>  <C-w><
nnoremap <Right> <C-w>>
nnoremap <Down>  <C-w>+
nnoremap <Up>    <C-w>-

" Use g] mainly for tag jump
nnoremap <C-]>  g<C-]>
nnoremap g<C-]> <C-]>

" Disable K to run man command
" ref. http://vim.wikia.com/wiki/Disable_built-in_command
nnoremap K <Nop>
vnoremap K <Nop>

" Enable to move cursor in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>

" Spell check
" ref. http://qiita.com/crispy/items/9a49d7dc792740f062ab
set spelllang=en,cjk
function! ToggleSpell()
  if &spell == 0
    syntax off
    hi SpellBad cterm=underline
    hi SpellBad ctermbg=red
    hi SpellBad ctermfg=white
    hi SpellCap cterm=underline
    hi SpellCap ctermbg=blue
    hi SpellCap ctermfg=white
    hi SpellRare ctermbg=white
    hi SpellRare ctermfg=black
    hi SpellLocal ctermbg=green
    hi SpellLocal ctermfg=white
    " ref. https://stackoverflow.com/questions/6008921/how-do-i-change-the-highlight-style-in-vim-spellcheck
    " ref. vim :help spell.txt
    set spell
  else
    syntax on
    " Reset ctermbg
    " ref. "show a vertical line ..." (search "colorcolumn" in this file)
    hi ColorColumn ctermbg=0
    " Reset vim-indent-guides ctermbg
    " ref. "vim-indent-guides configurations" (search "vim-indent-guides configurations" in this file)
    hi IndentGuidesOdd  ctermbg=237 ctermfg=60 guibg=cyan
    hi IndentGuidesEven ctermbg=236 ctermfg=59 guibg=blue
    set nospell
  endif
endfunction
nnoremap sp :call ToggleSpell()<CR>

hi SpellBad ctermfg=black
hi SpellRare ctermfg=black
" ref. https://qiita.com/shuhei/items/5ff5e9792746c70ab8ad
" check command
" :so $VIMRUNTIME/syntax/hitest.vim

if !has('mac')
  " collaboration with clipboard
  " ref. http://mba-hack.blogspot.jp/2013/02/clipboard.html
  set clipboard=unnamedplus
endif

" Disable JSON conceal
" ref.
"   http://qiita.com/kadoppe/items/ffaef1f5a69f2cfcf12e
"   http://qiita.com/karur4n/items/a26007236c59c5fb8735
let g:vim_json_syntax_conceal = 0

" Disable Markdown conceal
" ref. https://github.com/plasticboy/vim-markdown#syntax-concealing
" let g:vim_markdown_conceal = 0 " This doesn't work today...
autocmd Filetype markdown setl conceallevel=0

" Prettier
" ref. https://github.com/prettier/vim-prettier
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql,*.vue,*.yaml,*.html PrettierAsync
" autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'es5'
" ref. https://gist.github.com/kaosf/8480d59f8e760ac2f7f4c5c9f3154a75

" Rails
" Command :A to flip
"   app/controllers/*_controller.rb <-> spec/controllers/*_spec.rb
"   app/controllers/*_controller.rb <-> spec/requests/*_request_spec.rb
" ref. https://github.com/tpope/vim-rails/issues/368#issuecomment-265086019
let g:rails_projections = {
      \   "app/controllers/*_controller.rb": {
      \     "test": [
      \       "spec/requests/{}_spec.rb",
      \       "spec/controllers/{}_controller_spec.rb",
      \       "test/controllers/{}_controller_test.rb"
      \     ],
      \     "alternate": [
      \       "spec/requests/{}_spec.rb",
      \       "spec/requests/{}_request_spec.rb",
      \       "spec/controllers/{}_controller_spec.rb",
      \       "test/controllers/{}_controller_test.rb"
      \     ],
      \   },
      \   "spec/requests/*_spec.rb": {
      \     "command": "request",
      \     "alternate": "app/controllers/{}_controller.rb",
      \     "template": "require 'rails_helper'\n\n" .
      \       "RSpec.describe '{}' do\nend",
      \   },
      \   "spec/requests/*_request_spec.rb": {
      \     "command": "request",
      \     "alternate": "app/controllers/{}_controller.rb",
      \     "template": "require 'rails_helper'\n\n" .
      \       "RSpec.describe '{}' do\nend",
      \   },
      \ }

" don't expand tabs when editing
"   Go
"   Makefile
" source files
autocmd FileType go set noexpandtab
autocmd FileType make set noexpandtab

" Python indent
" Pattern 1: 4 spaces (recommended in pep8)
autocmd FileType python set shiftwidth=4
" " Pattern 2: tab
" autocmd FileType python set shiftwidth=8
" autocmd FileType python set noexpandtab

" Groovy indent
autocmd FileType groovy set shiftwidth=4

" golang
let g:go_fmt_command = "goimports"

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
hi IndentGuidesOdd  ctermbg=237 ctermfg=60 guibg=cyan
hi IndentGuidesEven ctermbg=236 ctermfg=59 guibg=blue

"""" show a vertical line on column 81
" ref.
"   http://blog.hanschen.org/2012/10/24/different-background-color-in-vim-past-80-columns/
"   http://stackoverflow.com/questions/2447109/showing-a-different-background-colour-in-vim-past-80-characters
"   http://vim-users.jp/2011/05/hack217/
if exists('&colorcolumn')
  set colorcolumn=121,141,161
  hi ColorColumn ctermbg=234
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
  " Do nothing
endtry
let g:BufKillCreateMappings = 0

" Enable to move between `do` and `end`, `def` and `end` or etc by `%`.
" ref.
"   http://qiita.com/alpaca_taichou/items/ab2ad83ddbaf2f6ce7fb
"   https://twitter.com/thinca/status/713407356978114561
if !exists('loaded_matchit')
  "" An error occurs on gvim
  "packadd matchit
  "" Use an old code of `runtime macros/matchit.vim` for gvim
  try
    packadd matchit
  catch
    runtime macros/matchit.vim
  endtry
endif

"let g:ruby_hl_lvar_show_warnings = 1

"""" Rust
" ref. https://github.com/rust-lang/rust.vim
let g:rustfmt_autosave = 1
nnoremap <leader>t :RustTest<CR>
" Clippy
" ref. https://github.com/wagnerf42/vim-clippy
" Run `rustup component add clippy --toolchain stable-x86_64-unknown-linux-gnu` before.
" Enable to run `cargo clippy`.
let g:syntastic_rust_checkers = ['clippy']
" deoplete-rust
" Install racer with:
" Run `rustup toolchain install nightly` and `cargo +nightly install racer`.
" How to check `rust_source_path`:
" Run `rustc --print sysroot` to get a path. Prepend `/lib/rustlib/src/rust/src` to it.
" ref. :help deopelete-rust
" ref. https://github.com/racer-rust/racer#configuration
let g:deoplete#sources#rust#racer_binary = $HOME.'/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = $HOME.'/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

" vimdiff color
" ref.
"   http://qiita.com/takaakikasai/items/b46a0b8c94e476e57e31
"   http://d.hatena.ne.jp/acotie/20090707/1246969274
" Run on Vim to check color name;
"   :runtime syntax/colortest.vim
highlight DiffAdd    cterm=bold ctermfg=green ctermbg=black
highlight DiffDelete cterm=bold ctermfg=red   ctermbg=black
highlight DiffChange cterm=bold ctermfg=white ctermbg=black
highlight DiffText   cterm=bold ctermfg=black ctermbg=yellow

command Utig Unite tig
"command Tig !tig
command Tig execute 'silent !tig' | redraw!
command Tigthis execute 'silent !tig' @% | redraw!
command Tigall execute 'silent !tig --all' | redraw!
" ref. http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts

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
  highlight ZenkakuSpace cterm=reverse ctermfg=238 gui=reverse guifg=grey33
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

"""" concealedyank.vim
" ref. http://d.hatena.ne.jp/chikatoike/20120918/1347923597
xmap Y <Plug>(operator-concealedyank)

"""" caw.vim
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)

"""" Change directory to the current file's directory
" ref. http://qiita.com/shiena/items/1e98fd14d0ef0084b17f
command Cdf cd %:h

"""" Formatting XML
" ref. http://qiita.com/shiena/items/8907c4b42d7958c53ce4
command! Formatxml :%s/></>\r</g | filetype indent on | setf xml | normal gg=G
"command! Formatxml :%s/></>^M</g | filetype indent on | setf xml | normal gg=G

" ref. https://stackoverflow.com/questions/29635150/how-do-i-fix-this-annoying-syntastic-rails-error
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of .* in void context'}

if filereadable($HOME . "/.vimrc-local")
  source ~/.vimrc-local
endif
