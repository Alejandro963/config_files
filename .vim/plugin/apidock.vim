" let g:browser = 'firefox -new-tab '
let g:browser = 'google-chrome -new-tab '
" On OSX - let g:browser = 'open -a /Applications/Firefox.app'

" Open the Ruby ApiDock page for the word under cursor, in a new Firefox tab
function! OpenRubyDoc(keyword)
  let url = 'http://apidock.com/ruby/'.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap RB :call OpenRubyDoc(expand('<cword>'))<CR>

" Open the Rails ApiDock page for the word under cursor, in a new Firefox tab
function! OpenRailsDoc(keyword)
  let url = 'http://apidock.com/rails/'.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap RR :call OpenRailsDoc(expand('<cword>'))<CR>

" Open the Rspec ApiDock page for the word under cursor, in a new Firefox tab
function! OpenRspecDoc(keyword)
  let url = 'http://apidock.com/rspec/'.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap RS :call OpenRspecDoc(expand('<cword>'))<CR>

" Find the Ruby ApiDock page for the word under cursor, in a new Firefox tab
function! FindRubyDoc(keyword)
  let url = 'http://apidock.com/ruby/search?query='.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap FRB :call FindRubyDoc(expand('<cword>'))<CR>

" Find the Rails ApiDock page for the word under cursor, in a new Firefox tab
function! FindRailsDoc(keyword)
  let url = 'http://apidock.com/rails/search?query='.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap FRR :call FindRailsDoc(expand('<cword>'))<CR>

" Find the Rspec ApiDock page for the word under cursor, in a new Firefox tab
function! FindRspecDoc(keyword)
  let url = 'http://apidock.com/rspec/search?query='.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap FRS :call FindRspecDoc(expand('<cword>'))<CR>
