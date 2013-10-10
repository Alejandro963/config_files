set encoding=utf-8

" leader amigable
let mapleader = ","

" habilitar funciones no compatibles con vi
set nocompatible

" cursor en doble línea
set cursorline
"set cursorcolumn
set ruler

filetype plugin indent on

" Habilitar phathogen
call pathogen#infect()

" vim-powerline https://github.com/Lokaltog/vim-powerline
set laststatus=2 " Always display the statusline in all windows
" Hide the default mode text (e.g. -- INSERT -- below the statusline)  "
set noshowmode
"let g:Powerline_symbols = 'fancy'   " Powerline
let g:Powerline_stl_path_style = 'short'
let g:Powerline_symbols = 'unicode'
let g:Powerline_mode_n = 'N'
let g:Powerline_mode_i = 'I'
let g:Powerline_mode_R = 'R'
let g:Powerline_mode_v = 'V'
let g:Powerline_mode_V = 'VL'
let g:Powerline_mode_cv= 'VB'
let g:Powerline_mode_s = 'S'
let g:Powerline_mode_S = 'SL'
let g:Powerline_mode_cs= 'SB'
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
  augroup END
endif

" usamos f12 para acceder a f1, para terminal
map <f12> <f1>

" F2 = OmniComplete
imap <f2> <c-x><c-o>

" YankRing show
nnoremap <silent> <F9> :YRShow<CR>

" Configuración del autocompletado inteligente (el de Python necesita un Vim
" compilado contra las librerías de Python para funcionar)
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" con <C-_> se cierra el tag abierto.
autocmd Filetype html,xml,eruby source ~/.vim/scripts/closetag.vim
"improve autocomplete menu color
" highlight Pmenu ctermbg=238 gui=bold

" Muestra los números de línea
set number

" Atajos para pestañas como los de Firefox/Chrome/Opera/etc
" Control T nueva pestaña (la cerramos con :q)
map <c-t> <esc>:tabnew<cr>

" Control PageUp/PageDown cambiar de pestaña
" con control no funciono tmux así que lo saqué
map <pageup> :tabp<cr>
map <pagedown> :tabn<cr>

" F10 activa modo pegar (no autoindenta, no descoloca lo que pegamos), F11
" lo desactiva
"map <f10> :set paste<cr>
"map <leader><f10> :set nopaste<cr>
""map <f10> :set pastetoggle

" Toggle paste mode while in insert mode with F10
set pastetoggle=<F10>

" Colores que no te dejan ciego (al gusto del consumidor, se puede escribir
" :color e ir dando a tab para ver las combinaciones existentes, hay más en
" vim.org)
"set term=xterm-256color
"colorscheme molokai
"colorscheme wombat256
"let g:molokai_original=1
" for background on ssh
set term=screen-256color
colorscheme darkZ

" color para resaltar la sintaxis
syntax on

" Que no haga la ventana de gvim demasiado pequeña
au GUIEnter * set lines=80 columns=160

"" F3 para habilitar NERDTree
map <f3> :NERDTreeToggle<cr>
"if !&diff
  "autocmd vimenter * NERDTree
  "" Open NERDTree on console vim startup
  "let g:nerdtree_tabs_open_on_console_startup = 1
  "let g:nerdtree_tabs_focus_on_files = 1
"endif
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=40

" Plugin taglist
" F5 muestra el frame de tags
map <f5> :TlistToggle<cr>
nnoremap <silent> <F8> :TagbarToggle<CR>

let Tlist_Use_Right_Window = 1     " Poner el frame en la derecha
let Tlist_WinWidth = 38            " Tamaño mínimo de frame de tags
let Tlist_File_Fold_Auto_Close = 1 " Auto close
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1

" Buffer explorer con F4
map <f4> :BufExplorer<cr>

" vim coverage rails tests
nnoremap <silent> <F7> :so coverage.vim<CR>

" switch to previous/next buffer
nnoremap <C-p> :BufSurfBack<CR>
nnoremap <C-n> :BufSurfForward<CR>

" TagList
set tags=tags,gems.tags;
" uso de ctags con gems
set tags+=gems.tags

" create tags file in current working directory
command! MakeTags :silent !ctags -R *

set complete=.,w,b,u,t,i

" tamaño (en espacios) de los tabuladores
set tabstop=2
set shiftwidth=2
set expandtab
" autoindenta
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent

" display the following nonprintable characters
set listchars=tab:·\ ,trail:·,precedes:«,extends:»
set list

" set default-encoding to utf-8
set encoding=utf-8

" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode.
set backspace=2

" autocompletar comandos
set wildmode=list:longest,full

" mark 80 and 120 characters
set colorcolumn=80,120
"set colorcolumn=80

" tidy
"nvmap ,x :!tidy -q -i --show-errors 0<CR>

" mouse en terminal
set mouse=a

" wrap
set nowrap

"I use ,W to mean “strip all trailing whitespace in the current file” so I can
"clean things up quickly:
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" This first mapping makes ,w open a new vertical split and switch over to it.
" Because really, how often do you split your window and not want to do
" something in the new split?
nnoremap <leader>w <C-w>v<C-w>l

" This next set of mappings maps <C-[h/j/k/l]> to the commands needed to move
" around your splits.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" New Vim users will want the following lines to teach them to do things
" right:
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" It also disables the arrow keys in insert mode to force you to get back into normal
" mode the instant you’re done inserting text, which is the “right way” to do things.
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" cambiar tab por 2 espacios (saqué /g por gdefault)
nnoremap <leader>T :%s/<tab>/\ \ <CR>

" moving in i mode
imap HH <left>
imap JJ <down>
imap KK <up>
imap LL <right>

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz
nmap ? ?zz

" Hard to type
"imap uu _
imap hh =>
"imap aa @

" I have a ,v mapping to reselect the text that was just pasted so I can
" perform commands (like indentation) on it:
nnoremap <leader>v V`]

" This last mapping lets me quickly open up my ~/.vimrc file in a vertically
" split window so I can add new things to it on the fly.
nnoremap <leader>ev :tabnew $MYVIMRC<cr>

" together make Vim deal with case-sensitive search intelligently
set ignorecase
set smartcase
" applies substitutions globally on lines. Without type /g
set gdefault
" to highlight search results
set incsearch
" show matching brackets
set showmatch

set hlsearch

" clear out a search
nnoremap <leader><space> :noh<cr>

" opciones de differ
set diffopt=vertical

" % permite navegar entre pares de signos
nnoremap <tab> %
vnoremap <tab> %

" save on focus lost
au FocusLost * :wa

" conque
let g:ruby_conque_rspec_command='spec'


let g:AutoClosePairs_add = "|"

" apidoc :
let g:browser = 'google-chrome -new-tab '

" clear out a search
nnoremap <leader>t :CommandT<cr>
nnoremap <leader>tt :CommandTFlush<cr>\|:CommandT<cr>
" find file
"map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
" find file in current directory
"map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>
let g:CommandTMaxHeight = 20
map <leader>tv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>tc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>tm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>th :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>tl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>tp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>ts :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>tf :CommandTFlush<cr>\|:CommandT features<cr>
map <leader>ta :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <leader>td :CommandTFlush<cr>\|:CommandT app/decorators<cr>
map <leader>tr :CommandTFlush<cr>\|:CommandT app/services<cr>

" surround
" usar con yss- (en la línea)
autocmd FileType ruby,eruby let g:surround_45 = "<% \r -%>"
" usar con yss= (en la línea)
autocmd FileType ruby,eruby let g:surround_61 = "<%= \r %>"

" Always edit file, even when swap file is found
set shortmess+=A

" Screen settings
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
"let g:ScreenShellInitialFocus = 'shell'
"let g:ScreenShellQuitOnVimExit = 0
map <F6> :ScreenShell<CR>
command -nargs=? -complete=shellcmd W  :w | :call ScreenShellSend("load '".@%."';")
map <Leader>s :w<CR> :call ScreenShellSend("spring rspec ".@% . ':' . line('.'))<CR>
map <Leader>S :w<CR> :call ScreenShellSend("rspec ".@% . ':' . line('.'))<CR>
map <Leader>e :w<CR> :call ScreenShellSend("spring cucumber --format=pretty ".@% . ':' . line('.'))<CR>
map <Leader>E :w<CR> :call ScreenShellSend("cucumber --format=pretty ".@% . ':' . line('.'))<CR>
map <Leader>b :w<CR> :call ScreenShellSend("break ".@% . ':' . line('.'))<CR>

" Simple re-format for minified Javascript
command! UnMinify call UnMinify()
function! UnMinify()
  %s/{\ze[^\r\n]/{\r/g
  %s/){/) {/g
  %s/};\?\ze[^\r\n]/\0\r/g
  %s/;\ze[^\r\n]/;\r/g
  %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
  normal ggVG=
endfunction

augroup MyAutoCmd
    autocmd!
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

" Tabularize tomado de: http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
" ver: https://github.com/godlygeek/tabular
if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:\zs<CR>
  vmap <leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

