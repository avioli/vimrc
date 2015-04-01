filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin() " required!

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

Plugin 'L9'                                                                     " script library
Plugin 'bufexplorer.zip'                                                        " buffer explorer -- ,be ,bs, bv
"Plugin 'dbext.vim'                                                              " sql exec
Plugin 'EasyGrep'                                                               " easygrep -- ,vv ,vV ,va ,vA ,vr ,vo :Grep :GrepAdd :Replace :ReplaceUndo :GrepOptions
"Plugin 'YankRing.vim'                                                           " yank buffer
"Plugin 'VimClojure'                                                             " clojure wrapper
"Plugin 'wincent/Command-T'                                                      " file grepper
"Plugin 'airblade/fuzzyfinder_textmate.git'                                      " fuzzyfinder textmate style
"Plugin 'kien/ctrlp.vim.git'                                                     " ctrl-p fuzzyfinder
"Plugin 'Shougo/unite.vim'                                                       " similar to fuzzyfinder and ctrl-p file grepper
Plugin 'airblade/vim-rooter.git'                                                " cwd change to project root
Plugin 'altercation/vim-colors-solarized.git'                                   " solarized colour scheme
Plugin 'bitfyre/vim-indent-html'                                                " indent html => http://www.vim.org/scripts/script.php?script_id=2075
Plugin 'cakebaker/scss-syntax.vim.git'                                          " scss syntax
Plugin 'int3/vim-extradite.git'                                                 " git commit browser
Plugin 'kana/vim-textobj-user.git'                                              " create your own text objects -- http://kana.github.com/config/vim/textobj-user.html
"Plugin 'kchmck/vim-coffee-script.git'                                           " coffee syntax
Plugin 'mileszs/ack.vim.git'                                                    " ack
"Plugin 'msanders/snipmate.vim.git'                                              " snippets textmate style
"Plugin 'nelstrom/vim-textobj-rubyblock.git'                                     " handle ruby def blocks -- DEPENDS on vim-textobj-user.git
Plugin 'pangloss/vim-javascript'                                                " better js indenting
let g:sparkupNextMapping = '<c-g>n'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}                                      " zen html
"Plugin 'scrooloose/nerdtree.git'                                                " dir and file tree browser
"Plugin 'slim-template/vim-slim.git'                                             " slim syntax
Plugin 'tomtom/tcomment_vim.git'                                                " comments handler
" Plugin 'EnhCommentify.vim'                                                     " comments handler
Plugin 'tpope/vim-fugitive.git'                                                 " git wrapper
"Plugin 'tpope/vim-rails.git'                                                    " rails wrapper
Plugin 'tpope/vim-repeat.git'                                                   " repeat with .
Plugin 'tpope/vim-surround.git'                                                 " surround stuff
Plugin 'tpope/vim-unimpaired.git'                                               " bracket mappings
Plugin 'tpope/vim-vividchalk.git'                                               " colour scheme
"Plugin 'vim-ruby/vim-ruby.git'                                                  " ruby wrapper
Plugin 'jnwhiteh/vim-golang'                                                    " go lang wrapper
Plugin 'kien/rainbow_parentheses.vim.git'                                       " rainbow parenthesis
Plugin 'chrisbra/NrrwRgn'                                                       " Narrowing means focussing on a region and making the rest inaccessible.
Plugin 'groenewege/vim-less'                                                    " LESS syntax
Plugin 'SyntaxAttr.vim'                                                         " display attribs under cursor
"Plugin 'Rykka/colorv.vim'                                                       " color editor within VIM
Plugin 'mattn/webapi-vim'                                                       " this one is needed for fetching color schemes online
Plugin 'morhetz/gruvbox.git'                                                    " a retro groove cholor scheme
"Plugin 'Valloric/YouCompleteMe.git'                                             " code-completion engine for vim
Plugin 'editorconfig/editorconfig-vim.git'                                      " editorconfig.org plugin
Plugin 'dag/vim-fish'                                                           " syntax for fish shell
Plugin 'SirVer/ultisnips'                                                       " snippets engine only
Plugin 'honza/vim-snippets'                                                     " snippets themselves
Plugin 'tpope/vim-abolish'                                                      " camel case to snake case: crc, crs, crm

" vim.org
" project => http://www.vim.org/scripts/script.php?script_id=69
" srt.vim => http://www.linuxpages.org/srt.vim_en.php
" sub.vim => http://www.linuxpages.org/sub.vim_en.php

call vundle#end() " required !


filetype plugin indent on " required

