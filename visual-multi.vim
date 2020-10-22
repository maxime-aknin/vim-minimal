let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'

" let g:VM_maps["Select Cursor Down"] = '<M-S-Up>'
" let g:VM_maps["Select Cursor Up"]   = '<M-S-Down>'
" fallback mac, use sed -n l in terminal to get the sequence 
" Update: marche pas
let g:VM_maps["Select Cursor Down"] = '\033[1;10A'
let g:VM_maps["Select Cursor Up"]   = '\033[1;10B'
let g:VM_maps["Add Cursor Down"]   = '<S-Down>'
let g:VM_maps["Add Cursor Up"]     = '<S-Up>'

let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'
