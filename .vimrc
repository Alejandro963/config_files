call pathogen#infect()
"
" many things stolen from
"   https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" options. run  `:options` for help
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1 important
set nocompatible
" Toggle paste mode while in insert mode with F10
set pastetoggle=<F10>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2 moving around, searching and patterns
" to highlight search results
set incsearch
" together make Vim deal with case-sensitive search intelligently
set ignorecase
set smartcase
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3 tags
" TagList
set tags=tags,gems.tags;
" uso de ctags con gems
set tags+=gems.tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 4 displaying text
set scrolloff=1
set nowrap
set list
set listchars=tab:·\ ,trail:·,precedes:«,extends:»
set number
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 5 syntax, highlighting and spelling
set hlsearch
" cursor en doble línea
set cursorline
" mark 80 and 120 characters
set colorcolumn=80,120
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 6 multiple windows
"" vim-powerline https://github.com/Lokaltog/vim-powerline
set laststatus=2 " Always display the statusline in all windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 7 multiple tab pages
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 8 terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 9 using the mouse
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"10 printing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"11 messages and info
set shortmess+=A
set showcmd
set ruler
" vim-Powerline  Hide the default mode text (-- INSERT -- below the statusline)
set noshowmode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"12 selecting text
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"13 editing text
set formatoptions=tcqr
set complete=.,w,b,u,t,i
" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode.
set backspace=indent,eol,start
" show matching brackets
set showmatch
set nrformats-=octal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"14 tabs and indenting
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
" use smartindent or cindent (cinoptions only for cindent)
set smartindent
"set cindent
"set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set shiftround
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"15 folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"16 diff mode
set diffopt=vertical
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"17 mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"18 reading and writing files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"19 the swap file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"20 command line editing
set wildmode=list:longest,full
set undofile
if &undodir =~# '^\.\%(,\|$\)'
  let &undodir = "/home/alejandro/bk/vim/undodir," . &undodir
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"21 executing external commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"22 running make and jumping to errors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"23 language specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"24 multi-byte characters
set encoding=utf-8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"25 various
" applies substitutions globally on lines. Without type /g
set gdefault
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" else
colorscheme darkZ
filetype plugin indent on
syntax on
let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change tab with 2 spaces
nnoremap <leader>T :%s/<tab>/\ \ <CR>
" I have a ,v mapping to reselect the text that was just pasted so I can
" perform commands (like indentation) on it:
nnoremap <leader>v V`]
" This last mapping lets me quickly open up my ~/.vimrc file in a new tab
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
" show time in cmd line
nnoremap <leader>et :echo strftime("%l:%M")<cr>
" clear out a search
nnoremap <leader><space> :noh<cr>
" % permite navegar entre pares de signos
nnoremap <tab> %
vnoremap <tab> %

map <c-t> <esc>:tabnew<cr>

"map <pageup> :tabp<cr>
map <leader>p :tabp<cr>
"map <pagedown> :tabn<cr>
map <leader>n :tabn<cr>

" copy to clipboard
map <leader>cy "*y
" paste from clipboard
map <leader>cp "*p
map <leader>cP "*P

" switch to previous/next buffer
"nnoremap <C-p> :BufSurfBack<CR>
"nnoremap <C-n> :BufSurfForward<CR>

" Map ee to open file in same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ee :edit %%

"I use ,W to mean “strip all trailing whitespace in the current file” so I can
"clean things up quickly:
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" splits
" open a new vertical split and switch over to it.
nnoremap <leader>w <C-w>v<C-w>l
" from: https://github.com/vijaydev/dotfiles/blob/master/vimrc
nnoremap ss <C-w>s
nnoremap vv <C-w>v
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

" FIXME: not working
imap <silent> <leader>h #{}<Esc>hi
" FIXME: not working
imap <silent> <C-H> =><Space>
imap <silent> <C-K> <%  -%><Esc>3hi
imap <silent> <C-G> <% end -%><CR>
imap <silent> <C-L> <%=  %><Esc>2hi

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" experimental
"
nnoremap \ ,
" very magic search: the pattern after it all ASCII characters except
"'0'-'9', 'a'-'z', 'A'-'Z' and '_' have a special meaning.
nnoremap / /\v
vnoremap / /\v
nnoremap Y y$
nnoremap & :&&<cr>

" moving in i mode
"imap HH <left>
"imap JJ <down>
"imap KK <up>
"imap LL <right>

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz
nmap ? ?zz

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" create tags file in current working directory
command! MakeTags :silent !ctags -R *

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" vim-ruby
let g:ruby_indent_access_modifier_style = 'outdent'

" con <C-_> se cierra el tag abierto.
autocmd Filetype html,xml,eruby source ~/.vim/scripts/closetag.vim

" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Que no haga la ventana de gvim demasiado pequeña
autocmd GUIEnter * set lines=80 columns=160

" save on focus lost
autocmd FocusLost * :wa

augroup MyAutoCmd
    autocmd!
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" YankRing show
nnoremap <silent> <F9> :YRShow<CR>

" NERDTree
map <f3> :NERDTreeToggle<cr>
"if !&diff
  "autocmd vimenter * NERDTree
  "" Open NERDTree on console vim startup
  "let g:nerdtree_tabs_open_on_console_startup = 1
  "let g:nerdtree_tabs_focus_on_files = 1
"endif
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=40

nnoremap <silent> <F8> :TagbarToggle<CR>

" Buffer explorer con F4
map <f4> :BufExplorer<cr>

" vim coverage rails tests
nnoremap <silent> <F7> :so coverage.vim<CR>

" surround
" usar con yss- (en la línea)
autocmd FileType ruby,eruby let g:surround_45 = "<% \r -%>"
" usar con yss= (en la línea)
autocmd FileType ruby,eruby let g:surround_61 = "<%= \r %>"

" conque
let g:ruby_conque_rspec_command='spec'


let g:AutoClosePairs_add = "|"

" apidoc :
let g:browser = 'google-chrome -new-tab '

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin taglist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F5 muestra el frame de tags
map <f5> :TlistToggle<cr>
let Tlist_Use_Right_Window = 1     " Poner el frame en la derecha
let Tlist_WinWidth = 38            " Tamaño mínimo de frame de tags
let Tlist_File_Fold_Auto_Close = 1 " Auto close
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin CommandT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>t :CommandT<cr>
nnoremap <leader>tt :CommandTFlush<cr>\|:CommandT<cr>
let g:CommandTMaxHeight = 30
map <leader>tv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>tc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>tm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>th :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>tl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>to :CommandTFlush<cr>\|:CommandT config<cr>
map <leader>tp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>ts :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>tf :CommandTFlush<cr>\|:CommandT features<cr>
map <leader>ta :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <leader>td :CommandTFlush<cr>\|:CommandT app/decorators<cr>
map <leader>tr :CommandTFlush<cr>\|:CommandT app/services<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Screen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"map <Leader>b :w<CR> :call ScreenShellSend("break ".@% . ':' . line('.'))<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Tabularize
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" from: http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
      autocmd InsertEnter * set timeoutlen=0
      autocmd InsertLeave * set timeoutlen=1000
  augroup END
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Simple re-format for minified Javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! UnMinify call UnMinify()
function! UnMinify()
  %s/{\ze[^\r\n]/{\r/g
  %s/){/) {/g
  %s/};\?\ze[^\r\n]/\0\r/g
  %s/;\ze[^\r\n]/;\r/g
  %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
  normal ggVG=
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>f :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>l :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTRACT VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ExtractVariable()
    let name = input("Variable name: ")
    if name == ''
        return
    endif
    " Enter visual mode (not sure why this is needed since we're already in
    " visual mode anyway)
    normal! gv

    " Replace selected text with the variable name
    exec "normal c" . name
    " Define the variable on the line above
    exec "normal! O" . name . " = "
    " Paste the original selected text to be the variable value
    normal! $p
endfunction
vnoremap <leader>rv :call ExtractVariable()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INLINE VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InlineVariable()
    " Copy the variable under the cursor into the 'a' register
    :let l:tmp_a = @a
    :normal "ayiw
    " Delete variable and equals sign
    :normal 2daW
    " Delete the expression into the 'b' register
    :let l:tmp_b = @b
    :normal "bd$
    " Delete the remnants of the line
    :normal dd
    " Go to the end of the previous line so we can start our search for the
    " usage of the variable to replace. Doing '0' instead of 'k$' doesn't
    " work; I'm not sure why.
    normal k$
    " Find the next occurence of the variable
    exec '/\<' . @a . '\>'
    " Replace that occurence with the text we yanked
    exec ':.s/\<' . @a . '\>/' . @b
    :let @a = l:tmp_a
    :let @b = l:tmp_b
endfunction
nnoremap <leader>ri :call InlineVariable()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1 || match(current_file, '\<services\>') != -1
  let in_app_assets = match(current_file, '\<javascripts\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    if in_app_assets
      let new_file = substitute(new_file, '^app/assets/', '', '')
      let new_file = substitute(new_file, '\.e\?coffee$', '_spec.coffee', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app_assets
      let new_file = 'app/assets/' . new_file
      let new_file = substitute(new_file, '_spec\.coffee$', '.coffee', '')
    end
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! MapCR()
  "nnoremap <cr> :call RunTestFile()<cr>
"endfunction
"call MapCR()
nnoremap <leader>U :call RunTestFile()<cr>
nnoremap <leader>u :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('')<cr>
nnoremap <leader>m :call TestModified()<cr>
"nnoremap <leader>c :w\|:!script/features<cr>
"nnoremap <leader>w :w\|:!script/features --profile wip<cr>

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! RunTestFile(...)
    if a:0 && match(expand("%"), '\.coffee$') == -1
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.coffee\|.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end
    :silent !echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    :silent !echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    if match(a:filename, '\.coffee') != -1
        exec ":silent !echo 'time spring teaspoon '" . a:filename
        exec ":!time spring teaspoon " . a:filename
    else
        exec ":silent !echo 'time spring rspec --color '" .  a:filename
        exec ":!time spring rspec --color " . a:filename
    end
endfunction

" run tests on modified
function! TestModified()
  let args = system('git status -s spec | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let args_ary = split(args, '\n')
  let s = ''
  for arg in args_ary
    if arg =~ "spec_helper.rb" || arg =~ "support"
      echo arg . ' modified, run all tests'
      return
    endif
    if arg !~ "spec_helper.rb" && arg !~ "fabricators" && arg !~ "support"
      let s = s . ' ' . arg
    endif
  endfor
  call RunTests(s)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
