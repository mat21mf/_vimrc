

     " " ====== Vundle ===========
     " Note: Skip initialization for vim-tiny or vim-small.
     if 0 | endif

     if has('vim_starting')
       if &compatible
         set nocompatible               " Be iMproved
       endif

     filetype off

       " Required:
       if has("win32") || has("win64")
         set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
       elseif has("unix")
         set rtp+=~/.vim/bundle/Vundle.vim/
       endif
     endif

     "=========== vundle ============"

     call vundle#begin()

      "
      " Vundle
      "

      Plugin 'VundleVim/Vundle.vim'

      "
      " YouCompleteMe
      "

      Plugin 'Valloric/YouCompleteMe'
      " third_party/ycmd/ycmd/completers/
      let g:ycm_language_server = [ {'name': 'r', 'filetypes': ['r', 'rscript'], 'cmdline': ['/usr/local/bin/R', '--slave', '-e', 'languageserver::run()'] } ]
      let g:ycm_semantic_triggers = {
            \   'tex': ['{'],
            \   'r': ['re!..', '::', '$', '@']
            \   }
      set runtimepath+=~/.vim/bundle/YouCompleteMe
      let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
      let g:ycm_confirm_extra_conf=0
      let g:ycm_python_binary_path='/usr/bin/python3.11'
      let g:ycm_python_interpreter_path = '/usr/lib/python3.11'
     "let g:ycm_python_binary_path = '$HOME/.anaconda3/envs/geoenv/bin/python3.11'
     "let g:ycm_python_interpreter_path = '$HOME/.anaconda3/envs/geoenv/lib/python3.11'

      "
      " Interpretes
      "

      " jupyter ascending
      Plugin 'untitled-ai/jupyter_ascending.vim'
      nmap <space><space>x <Plug>JupyterExecute
      nmap <space><space>X <Plug>JupyterExecuteAll
      nmap <space><space>r <Plug>JupyterRestart

      " capslock
      Plugin 'tpope/vim-capslock'

      " vim-tmux-runner
      Plugin 'christoomey/vim-tmux-runner'
      let g:VtrUseVtrMaps = 1
      let g:VtrStripLeadingWhitespace = 1
      let g:VtrClearEmptyLines = 1
      " vim-tmux-runner + conda pendiente

      " vimux
      Plugin 'preservim/vimux'
      " spark-shell
      Plugin 'greghor/vim-pyShell'

      " python-mode
      Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

      " vim-repl
      Plugin 'sillybun/vim-repl'
      let g:repl_program = {
            \    'python': 'ipython',
            \    'default': 'bash'
            \    }
      let g:repl_predefine_python = {
            \   'pandas': 'import pandas as pd',
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
      let g:sendtorepl_invoke_key = "<localleader>l"
      let g:repl_python_pre_launch_command = 'source ~/.anaconda3/etc/profile.d/conda.sh && conda activate geoenv'
      nnoremap <localleader>r :normal :REPLToggle<Cr>
      nnoremap <localleader>ss :REPLSendSession<Cr>

      " vim-cpyvke
      " estado beta
      " Plugin 'ipselium/vim-cpyvke'

      "
      " Utilidades
      "

      Plugin 'tpope/vim-fugitive'
      set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
      Plugin 'idanarye/vim-merginal'
      Plugin 'shumphrey/fugitive-gitlab.vim'
      Plugin 'tpope/vim-surround'
      Plugin 'tpope/vim-repeat'
      Plugin 'tpope/vim-commentary'
      Plugin 'tpope/vim-eunuch'
      Plugin 'godlygeek/tabular'
      Plugin 'salsifis/vim-transpose'
      Plugin 'dhruvasagar/vim-table-mode'
      function! s:isAtStartOfLine(mapping)
          let text_before_cursor = getline('.')[0 : col('.')-1]
          let mapping_pattern = '\V' . escape(a:mapping, '\')
          let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
          return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
      endfunction

      inoreabbrev <expr> <bar><bar>
                \ <SID>isAtStartOfLine('\|\|') ?
                          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
      inoreabbrev <expr> __
                \ <SID>isAtStartOfLine('__') ?
                          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

      "
      " Barra de estado
      "

      " vim-airline
      Plugin 'vim-airline/vim-airline'
      let g:airline_theme='dark'

      " tagbar
      Plugin 'majutsushi/tagbar'
      nnoremap <F8> :TagbarToggle<CR>
      let g:tagbar_foldlevel = 2
      let g:tagbar_type_tex = {
          \ 'ctagstype' : 'tex',
          \ 'kinds'     : [
              \ 's:sections',
              \ 'u:subsections',
              \ 'g:graphics:0:0',
              \ 'l:labels',
              \ 'r:refs:1:0',
              \ 'p:pagerefs:1:0'
          \ ],
          \ 'sort'    : 0,
          \ }
      let g:tagbar_type_r = {
          \ 'ctagstype' : 'r',
          \ 'kinds'     : [
              \ 'f:Functions',
              \ 'g:GlobalVariables',
              \ 'v:FunctionVariables',
          \ ]
      \ }
      let g:tagbar_type_rmd = {
       \ 'ctagstype':'rmd'
       \ , 'kinds':['h:header', 'c:chunk', 'f:function', 'v:variable']
       \ , 'sro':'&&&'
       \ , 'kind2scope':{'h':'header', 'c':'chunk'}
       \ , 'sort':0
       \ , 'ctagsbin':'~/bin/rmdtags.py'
       \ , 'ctagsargs': ''
       \ }

      "
      " Esquemas de color
      "

      " jellybeans colorscheme
      Plugin 'nanotech/jellybeans.vim'

      "
      " R
      "

      " R vim
      Plugin 'ncm2/ncm2'
      Plugin 'roxma/nvim-yarp'
      Plugin 'jalvesaq/Nvim-R', {'branch': 'stable'}
      Plugin 'gaalcaras/ncm-R'

      " Mantener R terminal en todos los buffers
      " let R_path = '$HOME/mis.sources/contrib-src/R-3.6.1/build/bin'
       if has("win32") || has("win64")
         let R_path = '/usr/local/bin'
         if $TMUX != ''
               let R_source = '$HOME/vimfiles/bundle/Nvim-R/R/tmux_split.vim'
         endif
       elseif has("unix")
         let R_path = '/usr/local/bin'
         if $TMUX != ''
               let R_source = '$HOME/.vim/bundle/Nvim-R/R/tmux_split.vim'
         endif
       endif
      let R_in_buffer = 0
      let R_term_cmd = "kitty"
      let R_assign = 0
      let R_never_unmake_menu = 1

      "
      " SPSS
      "

      Plugin 'vim-scripts/spss-syntax-highlighting-file'

      "
      " Frontend
      "

      " emmet
      Plugin 'mattn/emmet-vim'
      let g:user_emmet_leader_key='<C-Z>'

      "
      " Presentaciones
      "

      " Quarto pandoc
      Plugin 'vim-pandoc/vim-pandoc-syntax'
      Plugin 'quarto-dev/quarto-vim'

      "
      " End plugins
      "

 call vundle#end()

 " Required:
 filetype plugin indent on

