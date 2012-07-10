set nobk

" ref. https://github.com/alwei/dotfiles/blob/master/.gvimrc#L14
"  t_vb=  makes vim not to flash
set visualbell t_vb=

set encoding=utf-8

" @rch850 taught to me
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" forgot where I did copy&paste from
set list
" set listchars=tab:>.
" set lcs=tab:>.,eol:$,trail:_,extends:\
set lcs=tab:>.,trail:_,extends:\
" set tabstop=4
set tabstop=2

" forgot where I did copy&paste from
set statusline=%F%=\[%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%03l,%03v][%2p%%]
set laststatus=2

" ref. http://labs.timedia.co.jp/2011/04/9-points-to-customize-automatic-indentation-in-vim.html
set autoindent
set expandtab

" ref. http://qiita.com/items/3211
function! s:set_fileformat()
        if &fileformat != "unix" && input("setlocal fileformat=unix?[y/n]") == "y"
                try
                        setlocal fileformat=unix
                catch
                endtry
        endif
endfunction
autocmd BufWritePre * :call <SID>set_fileformat()

" autocomplete end bracket
" ref. http://d.hatena.ne.jp/babie/20110130/1296348203
" via. https://github.com/sue445/dotfiles/blob/master/_vimrc
inoremap ( ()<ESC>i
inoremap <expr> ) ClosePair(')')
inoremap < <><ESC>i
inoremap <expr> ) ClosePair('>')
inoremap { {}<ESC>i
inoremap <expr> } ClosePair('}')
inoremap [ []<ESC>i
inoremap <expr> ] ClosePair(']')
" pair close checker.
" from othree vimrc ( http://github.com/othree/rc/blob/master/osx/.vimrc )
function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf
" autocomplete end bracket of erb
" ref. http://d.hatena.ne.jp/yamitzky/20111213/1323739808
" via. https://github.com/sue445/dotfiles/blob/master/_vimrc
inoremap <expr> % Lt_Percent_Completion()
function! Lt_Percent_Completion()
  if matchstr(getline('.'), '.', col('.') -1 ) == ">"
  return "\%\%\<Left>"
  else
  return "\%"
end
endf
