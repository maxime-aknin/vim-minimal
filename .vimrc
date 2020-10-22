"============================================================================
" load plugins and other config files
"============================================================================
source ~/.vim/shared_mappings.vim
source ~/.vim/highlights.vim
source ~/.vim/visual-multi.vim

"============================================================================
" this is the 21st century

set nocompatible

"============================================================================
" auto reload file on change

set autoread
" au FocusGained,BufEnter * :checktime
au FocusGained,BufEnter * :checktime


"============================================================================
" Line number, font & encoding

set number
" set relativenumber
set encoding=utf8
set fileencodings=utf8
set guifont=Hack_Nerd_Font:h18


"============================================================================
" navigate wrapped lines

set wrap
" noremap <silent> k gk
" noremap <silent> j gj
" noremap <silent> 0 g0
" noremap <silent> $ g$

"============================================================================
" disable auto comment on new line

" see https://superuser.com/questions/271023/can-i-disable-continuation-of-comments-to-the-next-line-in-vim
" autocmd BufNewFile,BufRead * setlocial formatoptions-=cro
" https://vim.fandom.com/wiki/Disable_automatic_comment_insertion
autocmd BufNewFile,BufRead * setlocal comments-=:// comments+=f://

"============================================================================
" Syntax

if exists('$TMUX')
" Colors in tmux
let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif

syntax on
set termguicolors
" if !has('gui_running')
" set t_Co=256
" endif

" colorscheme one
colorscheme night-owl
let g:lightline = { 'colorscheme': 'nightowl' }


" autocmd BufEnter * colorscheme one
" autocmd BufEnter *.php colorscheme challenger_deep
" colorscheme challenger_deep
" autocmd BufEnter * colorscheme challenger_deep
" autocmd BufEnter *.html,*.tpl,*.js,*.jsx,*.twig,*.yml,*.yaml,*.css,*.scss colorscheme one
set background=dark

" Random color schemes!
function! RandomColorScheme()
  let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n")
  exe 'so ' . mycolors[localtime() % len(mycolors)]
  unlet mycolors
endfunction
:command! NewColor call RandomColorScheme()

function! RandomBase16()
  let mycolors = split(globpath(&rtp,"**/colors/base16*.vim"),"\n")
  exe 'so ' . mycolors[localtime() % len(mycolors)]
  unlet mycolors
endfunction

:command! C call RandomBase16()

" Start new windows with a random color scheme
" call RandomBase16()
" :colorscheme base16-materia

"============================================================================
" ruler

" 'PaperColor_light',
" let g:lightline = {
"       \ 'colorscheme':  'one' 
"       \ }

" set laststatus=2
" show command in bottom bar
" set showcmd 
" hide all this junk after all
set laststatus=0
set noshowcmd
" set noshowmode "don't show --INSERT--
" don't show percentage etc
set noruler

"============================================================================
" copying and mouse, for the noob in me
"============================================================================

set mouse=a
vnoremap <A-c> "*y
vnoremap © "*y
" set mouse and always copy to clipboard (see :h clipboard)
" set clipboard+=unnamedplus

" delete with backspace visual mode to null register
vnoremap <BS> "_d

"============================================================================
" enable auto horizontal scroll

set sidescroll=1

"============================================================================
" cd to current opened file shortut
"============================================================================

cnoremap cdf cd %:h

"============================================================================
" search visually selected word

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"============================================================================
" disable wrapping

set nowrap

" may speed scroll when lagging
" see https://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
set lazyredraw

"============================================================================
" highlight current line

" set cursorline



"============================================================================
" load filetype-specific indent files from ~/.vim/after/ftplugin (e.g python.vim)

" filetype plugin indent on


"============================================================================
" smart indent

set autoindent
set smartindent


"============================================================================
" number of visual spaces per TAB

set tabstop=4


"============================================================================
" enable indenting with the good value

set shiftwidth=4


"============================================================================
" number of spaces in tab when editing

set softtabstop=4


"============================================================================
" tabs are spaces

set expandtab 

"============================================================================
" pasting
" removed cause using vim-pasta

" set paste
" preserve indentation
" nnoremap p p=`]
" normal paste
" nnoremap <S-p> p

" keep insert mode
inoremap <A-v> <C-o>"+P<C-o>=']
inoremap ◊ <C-o>"+P<C-o>=']

"============================================================================
" Use arrow keys to navigate after a :vimgrep or :helpgrep

nmap <silent> <RIGHT>         :cnext<CR>
nmap <silent> <RIGHT><RIGHT>  :cnfile<CR><C-G>
nmap <silent> <LEFT>          :cprev<CR>
nmap <silent> <LEFT><LEFT>    :cpfile<CR><C-G>

"============================================================================
" quick previous command
nnoremap <C-p> :<C-p>

"============================================================================
" Make :help appear in a full-screen tab, instead of a window

"Only apply to .txt files...
augroup HelpInTabs
autocmd!
autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
if &buftype == 'help'
"Convert the help window to a tab...
execute "normal \<C-W>T"
endif
endfunction

"============================================================================
" Allow deletes in Insert mode to keep deleting past the insertion point

set backspace=indent,eol,start


"============================================================================
" faster search

nnoremap <space> /


"============================================================================
" Turn on case-insensitive matches (but only when pattern is all-lowercase)

set ignorecase smartcase


"============================================================================
" Make searches look-ahead as you type

set incsearch


"============================================================================
" Make successful searches highlight all possible matches

set hlsearch

"============================================================================
" Make delete key in Normal mode remove the persistently highlighted matches

nmap <silent>  <BS>  :nohls<CR>

"============================================================================
" Make delete key in Normal mode remove the persistently highlighted matches
" don't re highlight when sourcing .vimrc
" https://stackoverflow.com/questions/15059464/vim-when-sourcing-vimrc-last-search-hl-re-appears
let @/ = ""


"============================================================================
" Set up persistent undo (with all undo files in one directory)

    if has('persistent_undo')
        set undofile
    endif

    set undodir=$HOME/.vim/.VIM_UNDO_FILES

    set undolevels=2500


"============================================================================
" When completing, show all options, insert common prefix, then iterate
"============================================================================

    set wildmode=longest:longest,full
    " ignore case when completing (e.g changing buffer)
    set wildignorecase


"============================================================================
" enable folding
"============================================================================

" set foldmethod=indent
set foldmethod=syntax
set foldlevelstart=99
" set nofoldenable


"============================================================================
" for phpfolding plugin
" unfold the automatic fold
" fix autofolding
"============================================================================

" autocmd BufNewFile,BufRead *.php normal zR
" let g:DisableAutoPHPFolding = 1

" space open/closes folds
" nnoremap <space> za


"============================================================================
" set timeout
"============================================================================

set timeoutlen=500


"============================================================================
" toggle commenting of lines with command + /,  works only in Macvim, in iterm I made the mapping in preferences keys
"============================================================================

nnoremap <D-/> :Commentary<CR>
vnoremap <D-/> :Commentary<CR>
" fallback in other environments
nnoremap <leader><leader> :Commentary<CR>
vnoremap <leader><leader> :Commentary<CR>

" smarty comments
autocmd FileType smarty setlocal commentstring={*\ %s\ *}

"============================================================================
" function for creating safe command aliases
" https://stackoverflow.com/questions/3878692/aliasing-a-command-in-vim
"============================================================================

fun! SetupCommandAlias(from, to)
    exec 'cnoreabbrev <expr> '.a:from
                \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
                \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun


"============================================================================
" alias for vertical resizing
"============================================================================

call SetupCommandAlias("vres","vertical resize")


"============================================================================
" Prettier
"============================================================================

nnoremap = :Prettier<CR>

" Run prettier asynchronously before saving
let g:prettier#autoformat=1
autocmd BufWritePre *.c, *.go, *.php,*.yml,*.tpl,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

"============================================================================
" NerdTree
"============================================================================

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
" auto cd in dir
" let g:NERDTreeChDirMode=3


"============================================================================
" reveal file
"============================================================================

nmap ,n :NERDTreeFind<CR>


"============================================================================
" map FZF to ,f and prevent FZF to open inside NERDTree
"============================================================================

" nnoremap <silent> <leader>f :FZF<cr>
" prevent from opening in nerdtree
" nnoremap <silent> <leader>f (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
" nnoremap <silent> <leader>f :FZF<cr>

" allow search in hidden files / folders
" let $FZF_DEFAULT_COMMAND='rg --hidden -l ""'
" uncomment to allow even for git ignored path
let $FZF_DEFAULT_COMMAND = 'rg  --hidden --follow --no-ignore-vcs -l "" -g "!{node_modules,.git}"'

" search in git files
nnoremap <silent> <leader>f :GFiles<cr>
" search in all files (uses $FZF_DEFAULT_COMMAND)
nnoremap <silent> <leader>ff :FZF<cr>

" search through tags shortcuts
nnoremap <leader>t :Tags<cr>
nnoremap <leader>bt :BTags<cr>
" open fzf file history (better than browse old)
nnoremap <leader>h :History<cr>

"============================================================================
" don't split on first NT window
"============================================================================

let g:ctrlp_dont_split = 'NERD'
" map shortcut + remove last param
nnoremap <silent> <C-f> :let g:ctrlp_dont_split=0 \| NERDTreeToggle<CR>


"============================================================================
" enable line numbers in Nerdtree
"============================================================================
" let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

"============================================================================
" fzf bindings
"============================================================================

set rtp+=/usr/local/opt/fzf

" go to definition in new tab
" nnoremap <leader>d <c-w><c-]><c-w>T
" go to defnition in same tab
" override by coc
" nnoremap <c-d> <c-]>

"============================================================================
" find tags in parent directories
"============================================================================

let local_vimrc = ".vimrc"
let local_tags = "tags"
let local_path = "/"
let current_path = getcwd()
" If the current path is a child of $HOME directory, start from $HOME
set tags+=tags;

" gutentag allow help cmd
" log activity
" let g:gutentags_trace=1
" show current tag file
" set statusline+=%{gutentags#statusline()}

"============================================================================
" ctrP ignore certain path
" Ignore some folders and files for CtrlP indexing
"============================================================================

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }


"============================================================================
" create directory when editing new file if needed
"============================================================================

cnoremap mkdir \!mkdir -p %:h

"============================================================================
" tagbar 
"============================================================================

nnoremap <C-t> :TagbarToggle<CR>

"============================================================================
" phpactor
"============================================================================

let g:phpactorPhpBin = 'php'
let g:phpactorBranch = 'master'
let g:phpactorOmniAutoClassImport = v:true


"============================================================================
" emmet
"============================================================================
"enable all functions, except normal (add n or replace by 'a' (all))
let g:user_emmet_mode='inv'
" enable only for html and css
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
" the final key map will be ,,
let g:user_emmet_leader_key=','


"============================================================================
" gd in new tab
"============================================================================

nnoremap <silent> <leader>d :tab split \| call CocActionAsync('jumpDefinition')<CR>

"============================================================================
" multi cursor mapping
"============================================================================


"============================================================================
" Ripgrep
"============================================================================

let g:rg_highlight=1

" open a new tab and search for something
nnoremap <leader>a :tab split<CR>:Rg ""<Left>

" Immediatly search for the word under the cursor
nnoremap <leader>A :tab split<CR>:Rg <C-r><C-w><CR>

"============================================================================
" UtilSnip mappings
"============================================================================

let g:UltiSnipsExpandTrigger='<S-tab>'
let g:UltiSnipsListSnippets='<c-Space>'
" g:UltiSnipsJumpForwardTrigger          <c-j>
" g:UltiSnipsJumpBackwardTrigger         <c-k>


"============================================================================
" vim bbye
"============================================================================

nnoremap <leader>q :Bdelete<CR>
" cnoremap q<CR> :Bdelete<CR>
" cnoremap qq<CR> :quit<CR>
                                             
"============================================================================ 
" plugin dragvisuals (Damian conway)
"============================================================================

runtime plugin/dragvisuals.vim                
                                             
vmap  <expr>  <S-h>   DVB_Drag('left')       
vmap  <expr>  <S-l>  DVB_Drag('right')      
vmap  <expr>  <S-j>   DVB_Drag('down')       
vmap  <expr>  <S-k>     DVB_Drag('up')         

" Bug
" vmap  <expr>  D        DVB_Duplicate()        

" still be able to move single line with ^j ^k in normal mode
let g:move_key_modifier = 'C'


"============================================================================
" plugin persistantvisuals (Damian conway)
"============================================================================

runtime plugin/persistantvisuals.vim


"============================================================================
" Automatically save the session when leaving Vim
"============================================================================

" autocmd! VimLeave * mksession
" autocmd! VimLeave * SSave!

"============================================================================
" Automatically load the session when entering vim
"============================================================================

" autocmd! VimEnter * source ~/Session.vim


"============================================================================
" Startify config
"============================================================================


call SetupCommandAlias("qq", "Startify")
" call SetupCommandAlias("qq", "quit")
let g:startify_session_persistence = 1
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_delete_buffers = 0
let g:startify_bookmarks = [
            \    {'ciga': '~/work/docker/ciga-docker/src/cigaretteelec'}, 
            \    {'so': '~/work/docker/sport/src/workout'}, 
            \]
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]



"============================================================================
" use vim for manual
"============================================================================

let $PAGER=''


"============================================================================
" help go to definitions
"============================================================================

" maps <c-)> i don't know why... 
" nnoremap <C-[> <C-]>

"============================================================================
" Trigger a highlight in the appropriate direction when pressing these keys:
"============================================================================

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


"============================================================================
" Faster scroll
"============================================================================
" nnoremap <C-e> 4<C-e>
" nnoremap <C-y> 4<C-y>
if(!has('nvim'))
    set ttyscroll=3
endif
"============================================================================


"============================================================================
" Make gf work with js imports
" https://damien.pobel.fr/post/configure-neovim-vim-gf-javascript-import/
"============================================================================ 

set path=.,src
set suffixesadd=.js,.jsx

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

autocmd BufEnter *.js, *.jsx, *.ts, *.tsx set includeexpr=LoadMainNodeModule(v:fname) 





"============================================================================
" autopairs
"============================================================================

let g:AutoPairsFlyMode = 0
" let g:AutoPairsShortcutJump = 'π' " alt + p
let g:AutoPairsShortcutFastWrap = 'ê' " alt + e
" let g:AutoPairsShortcutBackInsert = 'ß' " alt + b
" Jump previous pair
" Copied and modifed from auto pairs plugin
func! PairsJump()
  call search('''\|(\|{\|[\|"\|)\|}','W')
endf
func! PairsJumpBack()
  call search('''\|(\|{\|[\|"\|)\|}','bW')
endf

" Alt + b
inoremap <buffer> <silent> ß <ESC>:call PairsJumpBack()<CR>a
noremap <buffer> <silent> ß :call PairsJumpBack()<CR>
" Alt + p
inoremap <buffer> <silent> π <ESC>:call PairsJump()<CR>a
noremap <buffer> <silent> π :call PairsJump()<CR>


"============================================================================ 
" lusty explorer

" show dot files
let g:LustyExplorerAlwaysShowDotFiles = 1


"============================================================================ 
" Be able to undo every word !
" https://stackoverflow.com/questions/2895551/how-do-i-get-fine-grained-undo-in-vim
inoremap <Space> <Space><C-g>u


"============================================================================ 
" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'php': ['phpcbf']
\}

" let g:ale_php_phpcs_standard = 'PSR2'
" let g:ale_php_phpcbf_standard = 'PSR2'
let g:ale_php_phpcs_standard = '~/.vim/.php_cs.xml'
let g:ale_php_phpcbf_standard = '~/.vim/.php_cs.xml'
let g:ale_fix_on_save = 1



