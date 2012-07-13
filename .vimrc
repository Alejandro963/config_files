" leader amigable
let mapleader = ","

" habilitar funciones no compatibles con vi
set nocompatible

" cursor en doble línea
set cursorline
"set cursorcolumn
set ruler

filetype plugin on

" Habilitar phathogen
call pathogen#infect()

" usamos f12 para acceder a f1, para terminal
map <f12> <f1>

" F2 = OmniComplete
imap <f2> <c-x><c-o>

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
map <f10> :set paste<cr>
map <leader><f10> :set nopaste<cr>

" Colores que no te dejan ciego (al gusto del consumidor, se puede escribir
" :color e ir dando a tab para ver las combinaciones existentes, hay más en
" vim.org)
"set term=xterm-256color
"colorscheme molokai
"colorscheme wombat256 
"let g:molokai_original=1
colorscheme darkZ

" color para resaltar la sintaxis
syntax on

" Que no haga la ventana de gvim demasiado pequeña
au GUIEnter * set lines=80 columns=160

" F3 para habilitar NERDTree
map <f3> :NERDTreeToggle<cr>
autocmd vimenter * NERDTree
" Open NERDTree on console vim startup
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1

" Plugin taglist
" F5 muestra el frame de tags
map <f5> :TlistToggle<cr>

let Tlist_Use_Right_Window = 1     " Poner el frame en la derecha
let Tlist_WinWidth = 40            " Tamaño mínimo de frame de tags
let Tlist_File_Fold_Auto_Close = 1 " Auto close 

" Buffer explorer con F4
map <f4> :BufExplorer<cr>

" switch to previous/next buffer
nnoremap <C-p> :BufSurfBack<CR>
nnoremap <C-n> :BufSurfForward<CR>

" create tags file in current working directory
command! MakeTags :silent !ctags -R *

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
"set mouse=a

" wrap
set nowrap

"I use ,W to mean “strip all trailing whitespace in the current file” so I can
"clean things up quickly:
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" show matching brackets
set showmatch

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

" cambiar 2 espacios por tab (saqué /g por gdefault)
nnoremap <leader>t :%s/\ \ /<tab><CR>

" salir rapido de modo Insert
imap ññ <ESC>
imap hh <left>
imap jj <down>
imap kk <up>
imap ll <right>

" I have a ,v mapping to reselect the text that was just pasted so I can
" perform commands (like indentation) on it:
nnoremap <leader>v V`]

" This last mapping lets me quickly open up my ~/.vimrc file in a vertically
" split window so I can add new things to it on the fly.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" together make Vim deal with case-sensitive search intelligently
set ignorecase
set smartcase
" applies substitutions globally on lines. Without type /g
set gdefault
" to highlight search results
set incsearch
set showmatch
set hlsearch

" clear out a search
nnoremap <leader><space> :noh<cr>

" opciones de differ
set diffopt=vertical
