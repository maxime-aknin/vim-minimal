"============================================================================
" Set map key
"============================================================================

let mapleader = ","

"============================================================================
" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
"============================================================================

nnoremap <M-j> mmo<Esc>`m
nnoremap <M-k> mmO<Esc>`m

"============================================================================
" special chars for term: see https://vi.stackexchange.com/questions/2350/how-to-map-alt-key
"============================================================================

" nnoremap È :set paste<CR>m`O<Esc>``:set nopaste<CR>
" nnoremap Ï :set paste<CR>m`o<Esc>``:set nopaste<CR>

nnoremap È mmO<Esc>`m
nnoremap Ï mmo<Esc>`m


"============================================================================
" avoid escape key
"============================================================================

inoremap jk <esc>
inoremap kj <esc>
inoremap jj <esc>
inoremap kk <esc>
vnoremap ii <esc>
inoremap ç <esc>
vnoremap ç <esc>

"============================================================================
" better insert mode
"============================================================================

inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
inoremap <C-h> <C-o>h
inoremap <C-e> <C-o>e
inoremap <C-w> <C-o>w
inoremap <C-b> <C-o>b
inoremap <C-d> <C-o>d
inoremap <C-x> <C-o>x
inoremap <C-u> <C-o>u
inoremap <C-a> <esc>A
inoremap <C-^> <C-o>^
inoremap <C-;> <esc>:

"============================================================================
" yank to clipboard in visual mode
"============================================================================

vnoremap <A-c> "*y
vnoremap © "*y

"============================================================================
" insert ; at the end of the line
"============================================================================

inoremap ;; <Esc>A;
inoremap ,, <Esc>A,

"============================================================================
" navigation
"============================================================================
nnoremap ) }
" nnoremap } )
nnoremap ( {
" nnoremap { (

"============================================================================
" backspace behaviour
"============================================================================
vnoremap <BS> "_d
nnoremap <BS> i<BS>


"============================================================================
" delete / change to "trash" register
"============================================================================

nnoremap ^p "0p
nnoremap ¨P "0P
" nnoremap d "_d
" vnoremap d "_d
" nnoremap <leader>d d
" vnoremap <leader>d d
"
" nnoremap D "_D
" nnoremap <leader>D D
" vnoremap D "_D
" vnoremap <leader>D D
"
" nnoremap x "_x
" nnoremap <leader>x x
"
" nnoremap c "_c
" nnoremap <leader>c c
" vnoremap c "_c
" vnoremap <leader>c c


"============================================================================
" tabs shortcuts

ca tn tabnew
ca th tabp
ca tl tabn

nnoremap g( :tabp<CR>
