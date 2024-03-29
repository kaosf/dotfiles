" Deoplete configurations for neosnippet plugin
let g:deoplete#enable_at_startup = 1

" ref. https://github.com/Shougo/neosnippet.vim
"      https://github.com/Shougo/neosnippet.vim/blob/885f0e243b038499b0a0e700d3814101ba47ba6c/README.md#configuration

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" For my snippets
" ref. https://github.com/kaosf/ka-vim-snippets
let g:neosnippet#snippets_directory="~/.vim/ka-vim-snippets"
