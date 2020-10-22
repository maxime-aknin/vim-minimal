" *cterm-colors*

" NR-16   NR-8    COLOR NAME
" 0       0       Black
" 1       4       DarkBlue
" 2       2       DarkGreen
" 3       6       DarkCyan
" 4       1       DarkRed
" 5       5       DarkMagenta
" 6       3       Brown, DarkYellow
" 7       7       LightGray, LightGrey, Gray, Grey
" 8       0*      DarkGray, DarkGrey
" 9       4*      Blue, LightBlue
" 10      2*      Green, LightGreen
" 11      6*      Cyan, LightCyan
" 12      1*      Red, LightRed
" 13      5*      Magenta, LightMagenta
" 14      3*      Yellow, LightYellow
" 15      7*      White

" https://jordanelver.co.uk/blog/2015/05/27/working-with-vim-colorschemes/
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
function! MyHighlights() abort
    " :h coc-highlights
    " hi clear CocUnderline
    " hi CocUnderline NONE
    hi CocUnderline cterm=bold gui=NONE
    " hi CocErrorHighlight ctermfg=Gray cterm=bold guifg=#666666 gui=bold
    " hi CocWarningHighlight ctermfg=NONE cterm=bold guifg=NONE gui=NONE
    " hi CocInfoHighlight ctermfg=NONE cterm=NONE guifg=NONE gui=NONE
    " hi CocHintHighlight ctermfg=NONE cterm=NONE guifg=NONE gui=NONE
    " multiple cursor color
    " hi CocCursorRange ctermbg=Gray guibg=#666666
    " cursor bg
    " hi TermCursor guibg=#EEEEEE
    " hi Cursor guibg=#EEEEEE
    "
    hi MatchParen cterm=NONE ctermfg=LightGreen gui=NONE guifg=#5eba7d
    " search is greeeeeeeen
    hi Search cterm=underline ctermfg=LightGreen ctermbg=NONE gui=underline guifg=LightGreen guibg=NONE
    hi IncSearch cterm=underline ctermfg=LightGreen ctermbg=NONE gui=underline guifg=LightGreen guibg=NONE
    hi TabLine cterm=NONE ctermfg=15 ctermbg=242 gui=NONE guibg=#000000
    hi TabLineSel cterm=bold gui=bold guibg=#000000 guifg=LightRed
    hi TabLineFill cterm=NONE gui=NONE

endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END
