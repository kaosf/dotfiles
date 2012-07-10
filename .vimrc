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
