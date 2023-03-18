" ref. https://github.com/Shougo/dein.vim

let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

"""" Config example

" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set dein base path (required)
let s:dein_base = '~/.cache/dein/'

" Set dein source path (required)
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set dein runtime path (required)
execute 'set runtimepath+=' .. s:dein_src

" Call dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Your plugins go here:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

"""" Added by ka
call dein#add('scrooloose/nerdtree') " File manager
call dein#add('kaosf/vim-sudden-death', {'rev': 'remove-linebreaks'}) " Totsuzen no shi!!!!
call dein#add('tyru/caw.vim') " Toggle comment out by C-/
call dein#add('Shougo/neomru.vim') " MRU (Most Recently Used)
call dein#add('prettier/vim-prettier') " Prettier ref. https://prettier.io/
call dein#add('rhysd/committia.vim') " Git
call dein#add('qpkorr/vim-bufkill') " BD command
call dein#add('kana/vim-altercmd') " Swap bd <-> BD
call dein#add('tpope/vim-surround') " **Surrounding** ref. https://rcmdnk.com/blog/2014/05/03/computer-vim-octopress/
call dein#add('Shougo/neosnippet.vim') " neosnippet
call dein#add('Shougo/deoplete.nvim') " For neosnippet
call dein#add('Shougo/neosnippet-snippets') " some default snippets

" ddu plugins
" ref. https://github.com/Shougo/ddu.vim
" ref. https://zenn.dev/shougo/articles/ddu-vim-beta
call dein#add('vim-denops/denops.vim') " Need for ddu.vim
call dein#add('Shougo/ddu.vim')
call dein#add('Shougo/ddu-ui-ff')
call dein#add('Shougo/ddu-source-file')
call dein#add('Shougo/ddu-source-file_rec')
call dein#add('Shougo/ddu-source-register')
call dein#add('Shougo/ddu-filter-matcher_substring')
call dein#add('Shougo/ddu-commands.vim')
call dein#add('Shougo/ddu-kind-file')
call dein#add('lambdalisue/mr.vim') " For mr feature (data is stored in ~/.cache/mr)
call dein#add('kuuote/ddu-source-mr') " For `Ddu mr`
call dein#add('shun/ddu-source-buffer') " For `Ddu buffer`

"""" Added by ka END

" Finish dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

"""" Config example END

"""" My commands for Dein
command DeinInstall call dein#install()<CR>
command DeinUpdate call dein#update()<CR>
command DeinRecache call dein#recache_runtimepath()<CR>

"""" My configurations for some plugins

"" NERDTree
" ref. http://vim.1045645.n5.nabble.com/NERDTree-plugin-side-bar-width-td3747483.html
let g:NERDTreeWinSize=20
" Show hidden files
let NERDTreeShowHidden=1
" Shortcut for NERDTree command
nnoremap <silent> <leader>f :NERDTreeFocus<CR>

"" caw.vim
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)

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
endtry
let g:BufKillCreateMappings = 0

"" ddu
if filereadable($HOME . "/.config/nvim/ddu.vim")
  source ~/.config/nvim/ddu.vim
endif

"" neosnippet
if filereadable($HOME . "/.config/nvim/neosnippet.vim")
  source ~/.config/nvim/neosnippet.vim
endif
