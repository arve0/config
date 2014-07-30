set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'groenewege/vim-less'
" autocomplete brackets
Plugin 'delimitMate.vim'
" javascript
Plugin 'pangloss/vim-javascript'
"html
Plugin 'rstacruz/sparkup'
" python
Plugin 'davidhalter/jedi-vim'
" syntax errors, linting
Plugin 'scrooloose/syntastic'
" comment with ,c<space>
Plugin 'The-NERD-Commenter'
" yank history
Plugin 'vim-scripts/YankRing.vim'
" make often used snippets
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


let mapleader=","       " <leader> key
set nu                  " numbered lines
colorscheme darkblue    " colors
set wildmenu            " :e tabs menu
syntax on               " syntax highlighting
set autoindent
" virtual tabstops using spaces
set shiftwidth=4
set softtabstop=4
set expandtab
" toggling between tabs and 4 spaces
function! TabToggle()
  if &expandtab
    set shiftwidth=8
    set softtabstop=0
    set noexpandtab
  else
    set shiftwidth=4
    set softtabstop=4
    set expandtab
  endif
endfunction
" toggle tabbing with ,T
nmap <leader>T mz:execute TabToggle()<CR>'z

" default delimitmate
autocmd BufNewFile,BufRead * let delimitMate_matchpairs = "(:),[:],{:}"
autocmd BufNewFile,BufRead * let delimitMate_quotes = "\" ' `"
" XML <| -->  <|>
autocmd BufNewFile,BufRead *.html,*.xml let delimitMate_matchpairs = "(:),[:],{:},<:>"
" Python
autocmd BufNewFile,BufRead *.py let delimitMate_quotes = "' `"
" markdown
autocmd BufNewFile,BufRead *.md let delimitMate_quotes = ""

" ekstra enter
" {<cr>}:
" {
" pointer
" }
let delimitMate_expand_cr = 1

set wildignore=**/bower_components/*,**/node_modules/*

" yankring
nnoremap <silent> <leader>p :YRShow<CR>

" delete from end of line to (use J for join) - http://stackoverflow.com/questions/3983406/delete-newline-in-vim
nnoremap <silent> <leader>d Jd/

" Read/update from .vimrc
noremap <silent> <leader>U :so ~/.vimrc<CR>

" pointers wrap lines
set whichwrap+=<,>,[,]

" ;w -> toggle wrap
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function! ToggleOff()
  setlocal nowrap
  set virtualedit=all
endfunction
function! ToggleOn()
   setlocal wrap linebreak nolist
   set virtualedit=
   setlocal display+=lastline
endfunction
function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    call ToggleOff()
  else
    echo "Wrap ON"
    call ToggleOn()
  endif
endfunction

" Snippets bindings
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:snips_author='Arve Seljebu'
let g:snips_email='arve.seljebu@gmail.com'
let g:snips_github='arve0'

" allways show position
set ruler

" markdown filetype
autocmd BufRead,BufNew *.md set filetype=markdown

" do not count underscore_ as word
:set iskeyword-=_

" for translation work -> replace nynorsk with bokmål
function! ReplaceNN()
    " replace common words
    %s/Ein\([ \.]\)/En\1/ge
    %s/ ein\([ \.]\)/ en\1/ge
    %s/ eit\([ \.]\)/ et\1/ge
    %s/Dei\([ \.]\)/De\1/ge
    %s/ dei\([ \.]\)/ de\1/ge
    %s/Frå\([ \.]\)/Fra\1/ge
    %s/ frå\([ \.]\)/ fra\1/ge
    %s/Gjev\([ \.]\)/Gir\1/ge
    %s/ gjev\([ \.]\)/ gir\1/ge
    %s/ gjevne\([ \.]\)/ gitte\1/ge
    %s/ gjeven\([ \.]\)/ gitt\1/ge
    %s/ høgre\([ \.]\)/ høyre\1/ge
    %s/ høyrer\([ \.]\)/ hører\1/ge
    %s/ inneheld\([ \.]\)/ inneholder\1/ge
    %s/Rekne/Regne/ge
    %s/rekne/regne/ge
    %s/Same\([ \.]\)/Samme\1/ge
    %s/ same\([ \.]\)/ samme\1/ge
    %s/Sannsynet\([ \.]\)/Sannsynligheten\1/ge
    %s/ sannsynet\([ \.]\)/ sannsynligheten\1/ge
    %s/Sjå\([ \.]\)/Se\1/ge
    %s/ sjå\([ \.]\)/ se\1/ge
    %s/Tal\([ \.]\)/Tall\1/ge
    %s/ tal\([ \.]\)/ tall\1/ge
    %s/Talet\([ \.]\)/Antallet\1/ge
    %s/ talet\([ \.]\)/ antallet\1/ge
    %s/Til dømes\([ \.]\)/For eksempel\1/ge
    %s/ til dømes\([ \.]\)/ for eksempel\1/ge
    %s/Vere\([ \.]\)/Være\1/ge
    %s/ vere\([ \.]\)/ være\1/ge
    %s/Vert\([ \.]\)/Blir\1/ge
    %s/ vert\([ \.]\)/ blir\1/ge
    
    " ending in a -> end with en
    %s/\([a-zæøå]\)a\([ \.]\)/\1ene\2/ge

    " ending in ane -> end with ene
    %s/\([a-zæøå]\)ane\([ \.]\)/\1ene\2/ge

    " ending in ande -> end with ende
    %s/\([a-zæøå]\)ande\([ \.]\)/\1ende\2/ge

    " ending in are -> end with ere
    %s/\([a-zæøå]\)are\([ \.]\)/\1ere\2/ge

endfunction
noremap <silent> <Leader>nn :call ReplaceNN()<CR>

function! MakeSpace()
    " make some space between headlines
    %s/\n;/\r\r;/ge
endfunction
noremap <silent> <Leader>ms :call MakeSpace()<CR>

function! RemoveTranslate()
    " remove translate
    %s/^:*{{translate|.*$//ge
endfunction
noremap <silent> <Leader>rt :call RemoveTranslate()<CR>

