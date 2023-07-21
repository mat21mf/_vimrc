" General {

     set nocompatible    " use vim defaults
     set encoding=utf-8
     set ls=2            " allways show status line
     set tabstop=4       " numbers of spaces of tab character
     set shiftwidth=2    " numbers of spaces to (auto)indent
     set scrolloff=3     " keep 3 lines when scrolling
     set showcmd         " display incomplete commands
     set hlsearch        " highlight searches
     set incsearch       " do incremental searching
     set ruler           " show the cursor position all the time
     set visualbell t_vb=    " turn off error beep/flash
     set novisualbell    " turn off visual bell
     set nobackup        " do not keep a backup file
     set number          " show line numbers
     set ignorecase      " ignore case when searching
     "set noignorecase   " don't ignore case
     set title           " show title in console title bar
     set ttyfast         " smoother changes
     "set ttyscroll=0        " turn off scrolling, didn't work well with PuTTY
     set modeline        " last lines in document sets vim mode
     set modelines=3     " number lines checked for modelines
     set shortmess=atI   " Abbreviate messages
     set nostartofline   " don't jump to first character when paging
     set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
     set showtabline=4
     set linespace=5
     "set term=cons25
     "set viminfo='20,<50,s10,h

     "============= Tags =================="
     " archivos tags, universal ctags, exuberant ctags
     set tags+=$HOME/R/tags
     set tags+=$HOME/torch/tags
     set tags+=$HOME/git.repos/mxnet/tags
     set tags+=$HOME/git.repos/caffe/.tags


     "============== Plugins =============="
     if has("win32") || has("win64")
       source $HOME/vimfiles/bundle/plugins.vim
     elseif has("unix")
       source ~/.vim/bundle/plugins.vim
     endif



     " .vimrc
     filetype plugin indent on " load filetype plugins/indent settings
     set backspace=indent,eol,start " make backspace a more flexible
     set clipboard=unnamed         " share windows clipboard
     set clipboard=unnamedplus     " share windows clipboard
     if has("win32") || has("win64")
       set directory=$HOME/vimfiles/tmp/    " directory to place swap files in
       set backupdir=$HOME/vimfiles/backup/ " where to put backup files
     elseif has("unix")
       set directory=~/.vim/tmp/             " directory to place swap files in
       set backupdir=~/.vim/backup/          " where to put backup files
     endif
     set fileformats=unix,dos,mac " support all three, in this order
     set hidden " you can change buffers without saving
     " (XXX: #VIM/tpope warns the line below could break things)
     set iskeyword+=_,$,@,%,# " none of these are word dividers
     set mouse=a " use mouse everywhere ; a ==> v
     set noerrorbells " don't make noise
     set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
     "             | | | | | | | | |
     "             | | | | | | | | +-- "]" Insert and Replace
     "             | | | | | | | +-- "[" Insert and Replace
     "             | | | | | | +-- "~" Normal
     "             | | | | | +-- <Right> Normal and Visual
     "             | | | | +-- <Left> Normal and Visual
     "             | | | +-- "l" Normal and Visual (not recommended)
     "             | | +-- "h" Normal and Visual (not recommended)
     "             | +-- <Space> Normal and Visual
     "             +-- <BS> Normal and Visual
     set completeopt=menu,longest
    "set completeopt+=longest

     " auto completado
     setlocal complete+=.,w,b,u,t
     setlocal complete+=k/home/matiasfr/R/R.dict.txt
     setlocal iskeyword+=-

     set wildmenu " turn on command line completion wild style
     " ignore these list file extensions
     set wildignore+=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc
     set wildignore+=*.jpg,*.gif,*.png,*.pdf,*.djvu,.git
     set wildmode=list:longest " turn on wild mode huge list
    "set wildmode=list:longest,full
     set autochdir " always switch to the current file directory
    "set backup " make backup files
    "set directory=.,$TEMP
 " }

 "set autoindent         " always set autoindenting on
 "set smartindent        " smart indent
 "set cindent            " cindent
 set noautoindent
 set nosmartindent
 set nocindent
 syntax on               " syntax highlighing

 " movimiento vim terminal
 " https://unix.stackexchange.com/questions/1709/how-to-fix-ctrl-arrows-in-vim
 " nnoremap <ESC>[5D <C-Left>
 " nnoremap <ESC>[5C <C-Right>

 " https://superuser.com/questions/401926/how-to-get-shiftarrows-and-ctrlarrows-working-in-vim-in-tmux
   if &term =~ '^screen'
       " tmux will send xterm-style keys when its xterm-keys option is on
       execute "set <xUp>=\e[1;*A"
       execute "set <xDown>=\e[1;*B"
       execute "set <xRight>=\e[1;*C"
       execute "set <xLeft>=\e[1;*D"
   endif

 " https://www.reddit.com/r/vim/comments/fr369/make_vim_completion_popup_menu_work_just_like_in/
 " keep menu item always highlighted by simulating <Up> on pu visible
 inoremap <expr> <C-p> pumvisible() ? '<C-p>' :
   \ '<C-p><C-r>=pumvisible() ? "\<lt>Up>" : ""<CR>'


 "=========== Mappings ============"
 let mapleader = ","
 let maplocalleader = ";"
 set timeoutlen=500

 nnoremap <leader>et      :tabe<cr>
 nnoremap <leader>ls      :ls<cr>
 nnoremap <leader>ev      :tabe $MYVIMRC<cr>
 nnoremap <leader>cv      :bd .vimrc<cr>
 nnoremap <leader>ep      :tabe ~/.vim/bundle/plugins.vim<cr>
 nnoremap <leader>eb      :tabe ~/.bashrc<cr>
 nnoremap <leader>cb      :bd .bashrc<cr>
 nnoremap <leader>sv      :source $MYVIMRC<cr>
 nnoremap <leader><space> :nohlsearch<cr>

 " Agregar y quitar comentarios numeral
 nnoremap <leader>uu      :normal vip<cr>:g!/^####/s/^# /  /<cr>
 nnoremap <leader>cc      :normal vip<cr>:g!/^####/s/^  /# /<cr>
 nnoremap <leader>cm      :normal vip<cr>:g/^\(.*\)$/s//<!-- \1 -->/<cr>
 nnoremap <leader>cn      :normal vip<cr>:g/<!-- \(.*\) -->/s//\1/<cr>
 nnoremap <leader>cv      :normal vip<cr>:g/^  \(.*\)$/s//" \1/<cr>
 nnoremap <leader>cb      :normal vip<cr>:g/^" \(.*\)/s//  \1/<cr>

 "=========== Split ==============="
 set splitbelow
 set splitright

 " Usar tmux
 " nnoremap <C-J> <C-W><C-J>
 " nnoremap <C-K> <C-W><C-K>
 " nnoremap <C-L> <C-W><C-L>
 " nnoremap <C-H> <C-W><C-H>


 "========== Movimientos =========="
"nnoremap j 5j
"nnoremap k 5k
"nnoremap l 5l
"nnoremap h 5h



 "========== Buffers ============="

 nnoremap <leader>tb :tabe<cr>
 nnoremap <leader>bd :bd<cr>
 nnoremap <leader>bb :bd<cr>:tabe<cr>
 nnoremap <leader>w  :sil g/\t/s//    /g<cr>:w<cr>
 nnoremap <leader>a  :sil g/\t/s//    /g<cr>:wa<cr><cr>
 " nnoremap <leader>db :normal ggVGd<cr>:w<cr>
 """ Archivo $HOME/bin/Render.R está en el PATH
 " nnoremap <leader>mm :AsyncRun make<cr>
 " nnoremap <leader>mn :AsyncRun bash Compilar.sh<cr>
 " nnoremap <leader>nm :AsyncRun pdflatex %<cr>
 " nnoremap <leader>no :AsyncRun R --slave --args % < Render.R<cr>


 "========== ConTeXt ============="

  nnoremap <leader>nn :<c-u>update<cr>:ConTeXt<cr>
 "let g:tex_flavor = "plain"
 "let g:tex_flavor = "context"
 "let g:tex_flavor = "latex"

 "========= Spell ============"
 nnoremap <leader>sp :set spell!<cr>
 nnoremap <leader>sl :setlocal spell spelllang=es<cr>

 "========= Funciones ==========="
 nnoremap <leader>rc :source ~/.bin/convertirRscriptARmd.vim<cr>
 nnoremap <leader>rb :source ~/.bin/reenumerarBloques.vim<cr>
 nnoremap <leader>re :source ~/.bin/reemplazarEspacios.vim<cr>
 nnoremap <leader>rr :source ~/.bin/reemplazarRenombrado.vim<cr>
 nnoremap <leader>rd :%s/^\(.*\)\(\n\1\)\+$/\1/<cr>
 nmap <leader>yq :normal yss"<cr>
 nmap <leader>yc :normal yss]<cr>
 nmap <leader>yp :normal yss)<cr>
 nnoremap <leader>jq :sil g/^\([0-9a-z]\{8}\)\([0-9a-z]\{4}\)\([0-9a-z]\{4}\)\([0-9a-z]\{4}\)\([0-9a-z]\{12}\)$/s//\1-\2-\3-\4-\5/<cr>
 nnoremap <leader>qj :sil g/^\([0-9a-z]\{8}\)-\([0-9a-z]\{4}\)-\([0-9a-z]\{4}\)-\([0-9a-z]\{4}\)-\([0-9a-z]\{12}\)$/s//\1\2\3\4\5/<cr>
 " nnoremap <leader>tt :normal Vy \| <C-w>w \| :normal P


 "==============================="

 if has("gui_running")
     " See ~/.gvimrc
     set hlsearch
     set columns=120              " width = 180 columns
     set lines=30                 " height = 55 lines
     set guifont=Monospace\ 12    " use this font
     set mousehide
     colorscheme jellybeans
     set guioptions-=l
     set guioptions-=L
     set guioptions-=r
     set guioptions-=R
     set guioptions-=e
    "set langmenu=en_US.UTF-8
    "set selectmode=mouse,key,cmd
    "set keymodel=
    "map <C-V> "+gP
    "imap <C-V> <ESC><C-V>i
    "vmap <C-C> "+y
 else
     set hlsearch
    "set columns=95               " width = 180 columns
    "set lines=25                 " height = 55 lines
     set guifont=Monospace\ 14    " definir en terminal
     colorscheme jellybeans
     set mousehide
 endif



 if has("autocmd")
     " Restore cursor position
   augroup augroup06
     autocmd!
     au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

     " Filetypes (au = autocmd)
     au FileType helpfile set nonumber      " no line numbers when viewing help
     au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
     au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back

     " When using mutt, text width=72
     au FileType mail,tex set textwidth=72
     "au FileType cpp,c,java,sh,pl,php,phtml,asp  set autoindent
     au FileType cpp,c,java,sh,pl,php,phtml,asp,xml,javascript  set smartindent
    "nnoremap <C-p> :set invpaste paste?<CR>
    "set pastetoggle=<C-p>
     set showmode
     "au FileType cpp,c,java,sh,pl,php,phtml,asp  set cindent
     "au BufRead mutt*[0-9] set tw=72

     " Automatically chmod +x Shell and Perl scripts
     "au BufWritePost   *.sh             !chmod +x %
     "au BufWritePost   *.pl             !chmod +x %

     " File formats
     au BufNewFile,BufRead  *.phtml       set syntax=php
     au BufNewFile,BufRead  *.pls         set syntax=dosini
     au BufNewFile,BufRead  modprobe.conf set syntax=modconf
     au BufNewFile,BufRead  *.prg         set syntax=eviews
     au BufNewFile,BufRead  *.fhh         set syntax=cpp
     au BufNewFile,BufRead  *.mysql       set syntax=mysql
     au BufNewFile,BufRead  *.test        set syntax=mysql
     au BufNewFile,BufRead  *.sql         set syntax=sql
     au BufNewFile,BufRead  *.R           set syntax=r
     au BufNewFile,BufRead  *.r           set syntax=r
     au BufNewFile,BufRead  *.Rscript     set syntax=r
     au BufNewFile,BufRead  *.rscript     set syntax=r
     au BufNewFile,BufRead   .Rhistory    set syntax=r
     au BufNewFile,BufRead   .rhistory    set syntax=r
  """au BufNewFile,BufRead  *.Rmd         set syntax=r
  """au BufNewFile,BufRead  *.rmd         set syntax=r
     au BufNewFile,BufRead  *.m           set syntax=matlab
     au BufNewFile,BufRead  *.smcl        set syntax=smcl
     au BufNewFile,BufRead  *.ado         set syntax=stata
     au BufNewFile,BufRead  *.do          set syntax=stata
     au BufNewFile,BufRead  *.lua         set syntax=lua
     au BufNewFile,BufRead  *.tex         set syntax=tex
     au BufNewFile,BufRead  *.sps         set syntax=spss

     " FileType
     autocmd BufNewFile,BufRead *.Rscript set ft=r
     autocmd BufNewFile,BufRead *.rscript set ft=r

     " Ctrl+X O
    "autocmd FileType python     set omnifunc=pythoncomplete#Complete
    "autocmd FileType python     set omnifunc=python3complete#Complete
     autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
     autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
     autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
     autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
     autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
     autocmd FileType c          set omnifunc=ccomplete#Complete
    "autocmd FileType r          setlocal omnifunc=CompleteR
    "autocmd FileType r          setlocal completefunc=CompleteR
    "autocmd FileType rmd        setlocal omnifunc=CompleteR
    "autocmd FileType rmd        setlocal completefunc=CompleteR
    "autocmd Filetype lua        set omnifunc=luacomplete#Complete

     autocmd FileType php nnoremap <C-L> :!php -l %<CR>
  "  if has("win32") || has("win64")
  "    autocmd Filetype html,xml,xsl source $HOME/vimfiles/bundle/vim-closetag/plugin/closetag.vim
  "  elseif has("unix")
  "    autocmd Filetype html,xml,xsl source ~/.vim/bundle/vim-closetag/plugin/closetag.vim
  " endif
    "autocmd Filetype html,xml,xsl source $VIMRUNTIME/bundle/vim-closetag/plugin/closetag.vim
     autocmd FileType txt
         \ setlocal ai si et sta sw=4
         \ textwidth=80 backspace=indent,eol,start fo=croql
   augroup END
 endif




     " Autocomando para grabar .vimrc
     augroup augroup01
         autocmd!
         autocmd BufWritePost .vimrc source %
     augroup END



     "--ENABLE PYTHON/DJANGO OMNICOMPLETE

     filetype plugin on
     set omnifunc=syntaxcomplete#Complete
     augroup augroup02
       autocmd!
      "autocmd FileType python     set omnifunc=pythoncomplete#Complete
       autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
       autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
       autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
     augroup END



    " set verbose=1


" " ======== vala ========
" " Disable valadoc syntax highlight
" "let vala_ignore_valadoc = 1

" " Enable comment strings
" let vala_comment_strings = 1

" " Highlight space errors
" let vala_space_errors = 1
" " Disable trailing space errors
" "let vala_no_trail_space_error = 1
" " Disable space-tab-space errors
" let vala_no_tab_space_error = 1

" " Minimum lines used for comment syncing (default 50)
" "let vala_minlines = 120

" let g:tagbar_ctags_bin = "anjuta-tags"

  " Vala {{{3
"  let type_vala = {}
"  let type_vala.ctagstype = 'vala'
"  let type_vala.kinds = [
"  \ {'short' : 'c', 'long' : 'classes', 'fold' : 0},
"  \ {'short' : 'd', 'long' : 'delegates', 'fold' : 0},
"  \ {'short' : 'e', 'long' : 'enumerations', 'fold' : 0},
"  \ {'short' : 'E', 'long' : 'error domains', 'fold' : 0},
"  \ {'short' : 'f', 'long' : 'fields', 'fold' : 0},
"  \ {'short' : 'i', 'long' : 'interfaces', 'fold' : 0},
"  \ {'short' : 'm', 'long' : 'methods', 'fold' : 0},
"  \ {'short' : 'p', 'long' : 'properties', 'fold' : 0},
"  \ {'short' : 'r', 'long' : 'error codes', 'fold' : 0},
"  \ {'short' : 's', 'long' : 'structures', 'fold' : 0},
"  \ {'short' : 'S', 'long' : 'signals', 'fold' : 0},
"  \ {'short' : 'v', 'long' : 'enumeration values', 'fold' : 0}
"  \ ]
"  let type_vala.sro = '.'
"  let type_vala.kind2scope = {
"  \ 'i' : 'interface',
"  \ 'c' : 'class',
"  \ 's' : 'structure',
"  \ 'e' : 'enum'
"  \ }
"  let type_vala.scope2kind = {
"  \ 'interface' : 'i',
"  \ 'class' : 'c',
"  \ 'struct' : 's',
"  \ 'enum' : 'e'
"  \ }
" "let s:known_types.vala = type_vala



 " Keyboard mappings
"map <F1> :previous<CR>  " map F1 to open previous buffer
"map <F2> :next<CR>      " map F2 to open next buffer
"map <silent> <C-N> :silent noh<CR> " turn off highlighted search
"map ,v :sp ~/.vimrc<cr> " edit my .vimrc file in a split
"map ,e :e ~/.vimrc<cr>      " edit my .vimrc file
"map ,u :source ~/.vimrc<cr> " update the system settings from my vimrc file
 "----- write out html file
"map ,h :source $VIM/vim70/syntax/2html.vim<cr>:w<cr>:clo<cr>


" vim force mksession relative path
" http://superuser.com/questions/301342/how-to-make-vim-sessions-use-relative-paths




 " Common command line typos
  cnoremap W w
  cnoremap Q q



 " Keyboard mapping for numeric keypad
"imap <Esc>OM <c-m>
" map <Esc>OM <c-m>
"imap <Esc>OP <nop>
" map <Esc>OP <nop>
"imap <Esc>OQ /
" map <Esc>OQ /
"imap <Esc>OR *
" map <Esc>OR *
"imap <Esc>OS -
" map <Esc>OS -
"
"imap <Esc>Ol +
"imap <Esc>Om -
"imap <Esc>On ,
"imap <Esc>Op 0
"imap <Esc>Oq 1
"imap <Esc>Or 2
"imap <Esc>Os 3
"imap <Esc>Ot 4
"imap <Esc>Ou 5
"imap <Esc>Ov 6
"imap <Esc>Ow 7
"imap <Esc>Ox 8
"imap <Esc>Oy 9
"imap <Esc>Oz 0
"

function IncPatRango()
  /07
  normal Vy7pV6j
  normal :<80>ku<80>ku<80>kd<80>ku^M
  let i=8 | '<,'>g/07/s//\=printf('%02d',i)/g | let i+=1
endfunction

"command IncPatRango call IncPatRango()
nnoremap <leader>i :call IncPatRango()<cr>

" jupyter ascending
  nnoremap <leader>mp o# %% [markdown]<ESC>
  nnoremap <leader>jp o# %%<ESC>

 " ========= ANTIGUO ==========
 " Vimrc file, http://phuzz.org

" Borrar ^M:   :%s/.$// "(NO)
"              :%s/
"  "(ctrl+v ctrl+m)
" Junta lineas que comienzan con patron:
" %s/\n\(\(^[0-9]\{5}\)\@!.*\)/\1/
"
" Duplicados sin orden:
" %s/^\(.*\)\(\n\1\)\+$/\1/
" %s/\v^(.*)(\n\1)+$/\1/
"
" Ordenar lineas segun longitud:
" %!gawk '{print length, $0;}' | \cygwin\bin\sort -nr
" %!gawk '{print length, $0;}' | sort -nr
"
" Hash table en awk:
" cat test| gawk '{line="";for (i = 2; i <= NF; i++) line = line $i " "; table[$1]=table[$1] line;} END {for (key in table) print key " => " table[key];}'
" http://unix.stackexchange.com/questions/47786/concatenate-lines-by-first-column-by-awk-or-sed
" ""  | perl -F'\t' -lane 'push @{$groups{$F[0]}}, $F[1];
" ""          END { $" = "\t";
" ""          for $g (sort keys %groups) { print "$g\t@{$groups{$g}}" }}'
"
" Reemplazar endline newline sed:
" sed ':a;N;$!ba;s/\n/ /g'
" https://stackoverflow.com/questions/1251999/how-can-i-replace-a-newline-n-using-sed
"
" Macros:
" a: yyp ctrl a
" e: ctrl v 15 j c # esc
" f: ctrl v 15 j c espacio esc
" g: A  int ESC j
" k: vyjvp
" y: 2wi ENTER ESC
" z: yypj
" Macros por registro (respaldos):
" Revisar: http://vim.wikia.org/wiki/Macros/
" Pegar contenido de macro: Ctrl R Ctrl R "letra"
" Macro que revierte las filas:
" http://vim.wikia.com/wiki/Reverse_all_lines
"  g/^/m0

" Clipboard no funcionaba:
" +clientserver +clipboard +cmdline_compl +cmdline_hist +cmdline_info +comments

"BINARIO karioya 1
"let $VIMRUNTIME='C:/Users/mrebolledo/Downloads/vim__plugins/complete-x86/'
"set langmenu=en_US.utf8
"language messages en_US.utf8
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

"BINARIO karioya 2
"set langmenu=en_US.utf8
"let $LANG = 'en'
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"set encoding=utf-8
"set encoding=latin1
"set fileencodings=utf-8
"set fileencodings=latin1
"language en
"language message en
"set helplang=en
"let $VIMRUNTIME='c:/Users/mrebolledo/Downloads/vim-7.4.417/vim-7.4.417/'
"set runtimepath=$VIM,$VIMRUNTIME,$VIMRUNTIME/bundle/unite.vim/,$VIMRUNTIME/bundle/vimproc/
