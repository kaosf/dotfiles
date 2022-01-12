" Disable visual bell (blinking).
set visualbell t_vb=

" Set lines and columns default values explicitly.
" ...cause GVim is launched with weird window size sometimes...
set lines=24
set columns=80

" Change colorscheme to light-on-dark type.
" ref. http://superuser.com/questions/141685/setting-background-color-in-gvim
colorscheme desert
" Reset some bg colors.
hi NonText guibg=#444444
hi Normal guibg=#444444

" Remove all GUI parts.
" ref. http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
" ref. http://stackoverflow.com/questions/11215767/how-to-make-vim-gui-tab-menu-to-look-like-console-tab-menu
set guioptions-=e

" Set font.
" ref. https://forums.ubuntulinux.jp/viewtopic.php?id=15177
set guifont=Monospace\ 18
set guifontwide=Monospace\ 18

" Adjust font size.
" ref. http://vim.wikia.com/wiki/Change_font_size_quickly
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 48
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

function! AdjustFontSizeDefault()
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let newsize = 15
    let &guifont = fontname . newsize
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

command! DefaultFont call AdjustFontSizeDefault()

inoremap <S-C-v> <Esc>pa
