"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Sets how many lines of history VIM har to remember
set history=400

"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
set mouse=a

"Set file encoding
set fenc=utf-8
set fencs=utf-8,gbk,gb2312,gb18030,cp936

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Fast saving
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

"Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim/vimrc

set wildignore+=doc              " should not break helptags
set wildignore+=.git             " should not break clone

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set font to DejaVu Sans Mono 9pt
  set gfn=DejaVu\ Sans\ Mono\ 9

if has("gui_running")
  set guioptions-=T
  let psc_style='cool'
  colorscheme /ps_color
else
  set background=dark
  " colorscheme pablo
  colorscheme zellner
endif

"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=cheetah<cr>
map <leader>2 :set syntax=xhtml<cr>
map <leader>3 :set syntax=python<cr>
map <leader>4 :set ft=javascript<cr>
map <leader>5 :set ft=sh<cr>
map <leader>$ :syntax sync fromstart<cr>

autocmd BufEnter * :syntax sync fromstart

"Highlight current
if has("gui_running")
  set cursorline
  hi cursorline guibg=#333333
  hi CursorColumn guibg=#333333
endif

"Omni menu colors
hi Pmenu guibg=#333333
hi PmenuSel guibg=#555555 guifg=#ffffff

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
set so=7

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=2

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
set hid

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase
set incsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"show matching bracets
set showmatch

"How many tenths of a second to blink
set mat=2

"Highlight search things
set hlsearch

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
"Always hide the statusline
set laststatus=2

function! CurDir()
   let curdir = substitute(getcwd(), '/Users/haozhong/', "~/", "g")
   return curdir
endfunction

"Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

""""""""""""""""""""""""""""""
" Visual
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
map <space> /
map <c-space> ?

"Actually, the tab does not switch buffers, but my arrows
"Bclose function ca be found in "Buffer related" section
map <leader>bd :Bclose<cr>
map <down> <leader>bd
"Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

"Tab configuration
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>tn :tabnew .<cr>
map <C-l> :tabn<cr>
map <C-h> :tabp<cr>
map <C-n> :tabnew<cr>
map <C-k> :bn<cr>
map <C-j> :bp<cr>
try
  set switchbuf=usetab
  set stal=2
catch
endtry

"Moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Switch to current dir
map <leader>cd :cd %:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
")
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $w <esc>`>a"<esc>`<i"<esc>

"Map auto complete of (, ", ', [
inoremap $1 ()<esc>:let leavechar=")"<cr>i
inoremap $2 []<esc>:let leavechar="]"<cr>i
inoremap $4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap $3 {}<esc>:let leavechar="}"<cr>i
inoremap $q ''<esc>:let leavechar="'"<cr>i
inoremap $w ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<cr>i

imap <m-l> <esc>:exec "normal f" . leavechar<cr>a
imap <d-l> <esc>:exec "normal f" . leavechar<cr>a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My information
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab xname Amir Salihefendic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using control
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction
autocmd BufWrite *.py :call DeleteTrailingWS()

set completeopt=menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunction

function! DeleteTillSlash()
  let g:cmd = getcmdline()
  if MySys() == "linux" || MySys() == "mac"
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if MySys() == "linux" || MySys() == "mac"
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif
  return g:cmd_edited
endfunction

function! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunction

"Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./

cno $q <C-\>eDeleteTillSlash()<cr>

cno $c e <C-\>eCurrentFileDir("e")<cr>

cno $tc <C-\>eCurrentFileDir("tabnew")<cr>
cno $th tabnew ~/
cno $td tabnew ~/Desktop/

"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast open a buffer by search for a name
map <c-q> :sb

"Open a dummy buffer for paste
map <leader>q :e ~/buffer<cr>

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Buffer - reverse everything ... :)
map <F9> ggVGg?

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
set nofen
set fdl=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>

set smarttab
set lbr
set tw=500

""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

"Smart indet
set si

"C-style indeting
set cindent

"Wrap lines
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"For Cope
map <silent> <leader><cr> :noh<cr>

"Orginal for all
" map <leader>n :cn<cr>
map <leader>p :cp<cr>
map <leader>c :botright cw 10<cr>
map <c-u> <c-l><c-j>:q<cr>:botright cw 10<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove the Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>
inoremap <S-Insert> <ESC>"+p`]a

"Remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''

"Super paste
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

"A function for insert head message in source file
function! AddHeadMsg()
  call setline(1, "# ")
  call append(1, "# Author: Zowl - zhhbug@gmail.com")
  call append(2, "# "."Last modified: ". strftime("%Y-%m-%d %H:%M"))
endfunction

map <leader>a <esc>:call AddHeadMsg()<cr><esc>:$<esc>o
map <leader>u <esc>:/# *Last modified: /s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@<cr>

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>

" Haml
" Bundle "tpope/vim-haml"

" Javascript
" Bundle "pangloss/vim-javascript"
"au FileType javascript so ~/.vim/bundle/vim-javascript/syntax/javascript.vim
"function! JavaScriptFold()
"  setl foldmethod=syntax
"  setl foldlevelstart=1
"  syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
"
"  function! FoldText()
"    return substitute(getline(v:foldstart), '{.*', '{...}', '')
"  endfunction
"  setl foldtext=FoldText()
"endfunction
"au FileType javascript setl shiftwidth=4
"au FileType javascript setl tabstop=4
"au FileType javascript call JavaScriptFold()
"au FileType javascript setl fen
"au FileType javascript imap <c-t> console.log();<esc>hi
"au FileType javascript imap <c-a> alert();<esc>hi
"au FileType javascript setl nocindent
"au FileType javascript inoremap <buffer> $r return
"au FileType javascript inoremap <buffer> $d //<cr>//<cr>//<esc>ka<space>
"au FileType javascript inoremap <buffer> $c /**<cr><space><cr>**/<esc>ka
"
"" Bundle "hallettj/jslint.vim"
"" nmap <leader>jc :JSLintToggle<cr>
"" let g:JSLintHighlightErrorLine=0
"
"Bundle 'editorconfig/editorconfig-vim'
"Bundle 'maksimr/vim-jsbeautify'
"Bundle 'einars/js-beautify'
"
"nmap <leader>k :call JsBeautify()<cr>
"
"" CVim
"Bundle "c.vim--Schellong"
"let g:C_AuthorName = "zhonghao"
"let g:C_AuthorRef  = "ZOwl"
"let g:C_Email      = "zhhbug@gmail.com"
"let g:C_Company    = "www.bit.edu.cn"
"
"" Python
"Bundle "python.vim"
"" Bundle "python_check_syntax.vim"
"" let g:pcs_hotkey                      " run the checker, the default is  cs
"" let g:pcs_check_when_saving = false   " when true, the checker automaticlly run while saving, the default is true
"Bundle "virtualenv.vim"
"Bundle "pep8"
"let g:pep8_map='<leader>8'
"
"" Markdown
"Bundle "Markdown"
"
"" Bundle "b4winckler/vim-objc"
"" Bundle 'eraserhd/vim-ios.git'
"
"
"" Git integration
"Bundle "git.zip"
"Bundle "fugitive.vim"
"
"" Utility
"Bundle "surround.vim"
"Bundle "Align"
"
"" Indent Object
"Bundle "michaeljsmith/vim-indent-object"
"
"
"" Tagbar
"Bundle "majutsushi/tagbar"
"let g:tagbar_type_objc = {
"    \ 'ctagstype' : 'ObjectiveC',
"    \ 'kinds'     : [
"        \ 'i:interface',
"        \ 'I:implementation',
"        \ 'p:Protocol',
"        \ 'm:Object_method',
"        \ 'c:Class_method',
"        \ 'v:Global_variable',
"        \ 'F:Object field',
"        \ 'f:function',
"        \ 'p:property',
"        \ 't:type_alias',
"        \ 's:type_structure',
"        \ 'e:enumeration',
"        \ 'M:preprocessor_macro',
"    \ ],
"    \ 'sro'        : ' ',
"    \ 'kind2scope' : {
"        \ 'i' : 'interface',
"        \ 'I' : 'implementation',
"        \ 'p' : 'Protocol',
"        \ 's' : 'type_structure',
"        \ 'e' : 'enumeration'
"    \ },
"    \ 'scope2kind' : {
"        \ 'interface'      : 'i',
"        \ 'implementation' : 'I',
"        \ 'Protocol'       : 'p',
"        \ 'type_structure' : 's',
"        \ 'enumeration'    : 'e'
"    \ }
"\ }
"
"
"" VimCommander
"Bundle "vimcommander"
"noremap <silent> <F11> :cal VimCommanderToggle()<CR> 
"
"" Task List
"Bundle "TaskList.vim"
"map <leader>td <Plug>TaskList
"
"" tskeleton
"Bundle "https://github.com/tomtom/tlib_vim.git"
"Bundle "https://github.com/tomtom/tskeleton_vim.git"
"au BufNewFile *.py 0r ~/.tskeleton/skeletons/python.py | let IndentStyle = "python"
"au BufNewFile *.sh 0r ~/.tskeleton/skel/sh.skel | let IndentStyle = "sh"
"au BufNewFile *.c 0r ~/.tskeleton/skel/c.skel | let IndentStyle = "c"
"
"" Conque
"" Bundle "Conque-Shell"
"
"
"
"" Latex Suite
"Bundle 'vim-latex/vim-latex'
"let g:tex_flavor='latex'
"set iskeyword+=:
"
"
"" vim-trailing-whitespace
"Bundle 'bronson/vim-trailing-whitespace'
"
"" vim-airline
"Bundle 'bling/vim-airline'
"
"" ctrlp.vim
"Bundle 'kien/ctrlp.vim'
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"
"" context_filetype
"Bundle 'Shougo/context_filetype.vim'
"
"
"" Dockerfile
"Bundle 'ekalinin/Dockerfile.vim'
"
"
"" Scala
"Bundle 'derekwyatt/vim-scala'
"
"
"" EasyMotion
"" Bundle 'Lokaltog/vim-easymotion'
"
"" vue
"Bundle 'posva/vim-vue'
"
"" Dart
"Bundle 'dart-lang/dart-vim-plugin'

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  if has('win32') || has('win64')
    call dein#add('tbodt/deoplete-tabnine', { 'build': 'powershell.exe .\install.ps1' })
  else
    call dein#add('tbodt/deoplete-tabnine', {
          \ 'build': './install.sh',
          \ 'hook_add': "
          \ let g:deoplete#enable_at_startup = 1
          \ "})
  endif

  call dein#add('wsdjeg/dein-ui.vim')

  " RoR
  call dein#add("vim-scripts/rails.vim")
  call dein#add("thoughtbot/vim-rspec")

  " Emmet
  call dein#add('mattn/emmet-vim')
  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall

  " racer
  call dein#add('phildawes/racer')

  " rust
  call dein#add('rust-lang/rust.vim')
  call dein#add('racer-rust/vim-racer')
  call dein#add('cespare/vim-toml')

  " NerdTree
  call dein#add('scrooloose/nerdtree', {
        \ 'hook_add': "
        \ let NERDTreeIgnore = ['\.pyc$']
        \ "})
  
  " vim-nerdtree-tabs
  call dein#add('jistr/vim-nerdtree-tabs')
  " map <Leader>n <plug>NERDTreeTabsToggle<CR>
  
  " NerdCommenter
  " call dein#add("ddollar/nerdcommenter")

  " tComment
  call dein#add("tomtom/tcomment_vim", {
        \ 'hook_add': "
        \ nmap // :TComment<CR>
        \ vmap // :TComment<CR>
        \ "})

  " Command-T
  call dein#add("vim-scripts/Command-T")

  " BufExplorer
  call dein#add("vim-scripts/bufexplorer.zip")

  " FencView
  call dein#add('vim-scripts/FencView.vim', {
        \ 'hook_add': "
        \ let g:fencview_autodetect = 0\n
        \ let g:fencview_checklines = 10\n
        \ nmap fenc :FencAutoDetect
        \ let g:fencview_auto_patterns='*.txt,*.htm{l\=},*.php,*.c,*.py'
        \ "})

  " Go
  call dein#add('fatih/vim-go')

  " vim-airline
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " context_filetype
  call dein#add('Shougo/context_filetype.vim')

  call dein#end()
  call dein#save_state()
endif

" Automatically detect file types.
filetype plugin indent on

"Enable syntax hl
syntax enable
