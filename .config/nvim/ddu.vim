" Finish if the plugin hasn't been installed.
try
  call ddu#custom#patch_global({})
catch
  finish
endtry

" ddu settings
call ddu#custom#patch_global(#{
  \   ui: 'ff',
  \   sources: [
  \     #{name: 'file', params: {}},
  \     #{name: 'file_rec'},
  \     #{name: 'buffer'},
  \     #{name: 'register'},
  \     #{name: 'mr'}
  \   ],
  \   sourceOptions: #{
  \     _: #{
  \       matchers: ['matcher_substring'],
  \     },
  \     file_rec: #{
  \       matchers: ['matcher_substring', 'matcher_ignore_files'],
  \     },
  \   },
  \   filterParams: #{
  \     matcher_ignore_files: #{
  \       ignorePatterns: ['vendor/bundle'],
  \     },
  \   },
  \   kindOptions: #{
  \     file: #{
  \       defaultAction: 'open',
  \     },
  \   },
  \   uiParams: #{ ff: #{ startFilter: v:true } },
  \ })

" ddu key settings
autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>
    \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Space>
    \ <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> i
    \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q
    \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  nnoremap <buffer> <CR>
    \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> q
    \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
  inoremap <buffer><silent> <CR>
    \ <Esc><Cmd>:call ddu#ui#ff#do_action('leaveFilterWindow')<CR>
  inoremap <buffer> <C-j>
    \ <Cmd>call ddu#ui#ff#execute("call cursor(line('.')+1,0)")<CR>
  inoremap <buffer> <C-k>
    \ <Cmd>call ddu#ui#ff#execute("call cursor(line('.')-1,0)")<CR>
endfunction

" ddu keymappings
nnoremap <silent> <leader>uf :<C-u>Ddu file<CR>
" nnoremap <silent> <leader>ur :<C-u>Ddu file_rec<CR>
nnoremap <silent> <leader>ur :<C-u>call ddu#start(#{ sources: [#{ name: 'file_rec', params: #{ ignoredDirectories: ['.git', 'node_modules'] } }] })<CR>
nnoremap <silent> <leader>b :<C-u>Ddu buffer<CR>
nnoremap <silent> <leader>ug :<C-u>Ddu register<CR>
nnoremap <silent> <leader>m :<C-u>Ddu mr<CR>
