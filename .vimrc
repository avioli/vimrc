" This config is heavily influenced by Derek Wyatt's vimrc sourced from
" https://github.com/derekwyatt/vim-config
" and Gary Bernhardt's
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc


" Init Pathogen
filetype on
filetype off
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

filetype on
filetype plugin on
filetype indent on
"filetype indent plugin on

set nocompatible

" set indentation and tab stops
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" show matching bracket
set showmatch

" set the search scan to wrap lines
set wrapscan
" CHECK: let's see if I can live with case sensitive searches
"set noignorecase
" CHECK: make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" set the forward slash to be the slash of note.
set shellslash

" set visual beel
set vb

" allow bacspace over indent, eol, and start of an insert
set backspace=2

" make sure unsaved buffers are allowed to go in background.
" no "must save first" error
set hidden

" make the "cw" and like commands to put a $ at the end instead of just
" deleting the word
"set cpoptions=ces$
set cpoptions=B$

" set vi colors, turn syntax highlighting and set default colour scheme
set t_Co=256
" CHECK: the following might drop responsiveness
set cursorline
"colorscheme ir_black
"colorscheme xoria256
set background=light
colorscheme solarized
syntax on

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
"set t_ti= t_te=

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" hide buffers
set bufhidden=hide

" more useful statusline -- always on
set laststatus=2

" set the command line to two lines high
set cmdheight=2

" switch buffers checks only the open buffers
set switchbuf=useopen

"set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
"set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
" TODO: add fugitive@statusline() when installed
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]\ %{strftime('%I:%M%p')}

" some mapping and commands
cnoreabbrev nt NERDTreeToggle

" don't update display while executing macros
set lazyredraw

" don't show the current command in lower right corner. In OS X if lazydraw
" and showcmd are set it's damn slow
"set showcmd

" show the current mode
set showmode

" hide the mouse when typing
set mousehide
" TODO: check the "guicursor" setting if using the gui

" set timeout after chars as per Derek's vimrc for the "," commands
set timeoutlen=500

" keep more stuff in the history
set history=10000

" set which commands open the folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" keep 8 lines from top and bottom when scrolling
set scrolloff=8

" Allow the cursor to go into invalid places
" TODO: check if this is needed at all
"set virtualedit=all

" disable encryption
set key=

" better command line completion
set wildmenu
"set wildignorecase
" use emacs-style tab completion when selecting files, etc
"set wildmode=longest,list

" auto completion search sequence and depth -- same as derek wyatt
set complete=.,w,b,t

" show the whole tag when completion is showing a function
set showfulltag

" wrap text to 200 columns
set textwidth=200

" get rid of the silly characters in separators -- same as derek wyatt
" CHECK: what's the point of it? the help didn't clarified it. I need an
" actual example
set fillchars = ""

" ignore whitespace when diffing
set diffopt+=iwhite

" enable search highlighter
set hlsearch
" incrementally match the search
set incsearch

" add the unnamed register to the clipboard
set clipboard+=unnamed

" automatically read changed open files
set autoread

" make grep work with single file
set grepprg=grep\ -nH\ $*

" let's try line numbering as derek wyatt
set number
"set relativenumber
set numberwidth=5


" system default for mappings will be "," character
let mapleader = ","

" custom autocmds
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " Indent p tags
  "autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif
augroup END

" turn off the highlight search
nmap <silent> ,n :nohls<CR>
" hide search highlight if visible
:nohls

" edit vimrc file
nmap <silent> ,edw :vs<CR>:e ~/.vimrc_dw<CR>
nmap <silent> ,ev :vs<CR>:e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" easier horizontal scrolling
nmap <silent> <C-a> 10zl
nmap <silent> <C-i> 10zh

" use C-e to replace the original ',' mapping
" nnoremap <C-E> ,

" Windows
"noremap <silent> ,h :wincmd h<CR>
"noremap <silent> ,j :wincmd j<CR>
"noremap <silent> ,k :wincmd k<CR>
"noremap <silent> ,l :wincmd l<CR>
noremap <silent> ,ww :wincmd p<CR>
noremap <silent> ,SH :vertical resize -10<CR>
noremap <silent> ,SK :resize +10<CR>
noremap <silent> ,SJ :resize -10<CR>
noremap <silent> ,SL :vertical resize +10<CR>
noremap <silent> ,s8 :vertical resize 83<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>
noremap <silent> <c-l> :wincmd l<CR>
noremap <silent> <c-k> :wincmd k<CR>
noremap <silent> <c-h> :wincmd h<CR>
noremap <silent> <c-j> :wincmd j<CR>
noremap <silent> ,ml :wincmd L<CR>
noremap <silent> ,mk :wincmd K<CR>
noremap <silent> ,mh :wincmd H<CR>
noremap <silent> ,mj :wincmd J<CR>
noremap <silent> ,mo :wincmd o<CR>

" Buffers
noremap <silent> ,bn :bnext<CR>
noremap <silent> ,bN :bprevious<CR>
noremap <silent> ,bb :b#<CR>
" The following is (I thing) absolutely the same as :b#
"nnoremap ,, <c-^>

" Tabs
nmap <silent> ,tt :tabnext<CR>
nmap <silent> ,tT :tabprevious<CR>
nmap <silent> ,tn :tabnew<CR>
nmap <silent> ,td :tabclose<CR>
set showtabline=2

" files
nnoremap <silent> ,cdd :cd %:p:h<CR>:pwd<CR>

" insert mode
imap <c-l> <space>=><space>
imap <c-c> <esc>

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" ARROW KEYS ARE UNACCEPTABLE
map <Left> :echo "no!"<cr>
map <Right> :echo "No!"<cr>
map <Up> :echo "NO!"<cr>
map <Down> :echo "nO!"<cr>


" RENAME CURRENT FILE
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map ,rn :call RenameFile()<cr>

" let's try mapping "jj" to "esc" in "INSERT" mode
" DIDN'T LIKE IT 2011.09.24
"imap jj <esc>

" systax coloring limited to 2048 chars
set synmaxcol=2048

" NERD Tree settings
"
" toggle NERD Tree on and off with F7
nmap <F7> :NERDTreeToggle<CR>
" close NERD Tree with S-F7
nmap <S-F7> :NERDTreeClose<CR>
" show bookmarks table
let NERDTreeShowBookmarks=1
" don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$' ]

" TwitVim settings
"let twitvim_browser_cmd = 'chrome'
nmap ,tw :FriendsTwitter<cr>
nmap ,tm :UserTwitter<cr>
nmap ,tM :MentionsTwitter<cr>
nmap ,td :DMTwitter<cr>
nmap ,tD :DMTwitter<cr>
function! HandleURI()
    let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
    echo s:uri
    if s:uri != ""
        exec "!open \"" . s:uri . "\""
    else
        echo "No URI found in line."
    endif
endfunction
function! TwitVimMappings()
    nmap <buffer> U :exe ":UnfollowTwitter " . expand("<cword>")<cr>
    nmap <buffer> F :exe ":FollowTwitter " . expand("<cword>")<cr>
    nmap <buffer> 7 :BackTwitter<cr>
    nmap <buffer> 8 :ForwardTwitter<cr>
    nmap <buffer> 1 :PreviousTwitter<cr>
    nmap <buffer> 2 :NextTwitter<cr>
    nmap <buffer> ,sv :SearchTwitter #vim<cr>
    nmap <buffer> ,ss :UserTwitter smashingmag<cr>
    nmap <buffer> ,ls :ListTwitter Useful<cr>
    nmap <buffer> ,fa :FavTwitter<cr>
    nmap <buffer> ,ww :call HandleURI()<cr>
endfunction
augroup avioli_twitvim
    au!
    au FileType twitvim call TwitVimMappings()
augroup END

" remove trailing space when saving
autocmd BufWritePre * :%s/\s\+$//e

" handle correctly filetype syntax based on name
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" copy to system clipboard OSX
"vmap <C-S-c> y:call system("pbcopy", getreg("\""))<cr>
"nmap <C-S-v> :call setreg("\"", system("pbpaste"))<cr>p
set pastetoggle=<F2>



" =========== Command-T
"map <silent> ,, :CommandTFlush<cr>\|:CommandT<cr>

" taken from destroyallsoftware.com/file-navigation-in-vim.html
" Open files with ,f
map ,, :CommandTFlush<cr>\|:CommandT<cr>
" Open files, limited to the directory of the current file, with ,gf
" This requires the %% mapping found below.
map ,gf :CommandTFlush<cr>\|:CommandT %%<cr>


" =========== RAILS
map ,gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map ,gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map ,gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map ,gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map ,gl :CommandTFlush<cr>\|:CommandT lib<cr>
map ,gp :CommandTFlush<cr>\|:CommandT public<cr>
map ,gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>

map ,gr :topleft :split config/routes.rb<cr>
map ,gg :topleft 100 :split Gemfile<cr>

function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . _ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map ,gR :call ShowRoutes()<cr>


" EXTRACT VARIABLE (SKETCHY) -- Select something, press the keys and enter a var name. it will be inserted before the current row, assigned.
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
vnoremap ,rv :call ExtractVariable()<cr>


" CHECK: INLINE VARIABLE (SKETCHY) --
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
nnoremap ,ri :call InlineVariable()<cr>


" ============ Currently open file helpers
" place the currently open file's path in the command line
cnoremap %% <C-R>=expand('%:h').'/'<cr>
" edit/view constrained in the currently open file's dir
map ,e :edit %%
map ,v :view %%


" ============ Windows
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999


" ======= RSPEC
function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo
  "exec ":!bundle exec rspec " . a:filename
  exec ":!script/test " . a:filename
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_spec_file = match(expand("%"), '_spec.rb$') != -1
  if in_spec_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map ,t :call RunTestFile()<cr>
" Run only the example under the cursor
map ,T :call RunNearestTest()<cr>
" Run all test files
map ,a :call RunTests('spec')<cr>

" ========== CUCUMBER
nmap ,ff :w\|!script/features "%"<cr>

" ======== RAILS
" PROMOTE VARIABLE TO RSPEC LET
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map ,p :PromoteToLet<cr>


" SWITCH BETWEEN TEST AND PRODUCTION CODE
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap ,. :call OpenTestAlternate()<cr>


" iPad colour scheme fix
function! IPad()
  colorscheme xoria256
  set background=dark
endfunction
:command! IPad :call IPad()

" NoiPad colour scheme fix
function! NoIPad()
  set background=light
  colorscheme solarized
endfunction
:command! NoIPad :call NoIPad()

" external commands
:vnoremap ,ss !sort<cr>

" html entities
function! HTMLEncode()
ruby << EOF
  require 'json'
  @str=VIM::Buffer.current.line

  $char_to_entity = { }
  JSON.parse(File.open(File.expand_path('~/.vim/entities.txt')).read).each do |key,value|
    $char_to_entity[[key.to_i].pack('U')] = value
  end

  def encode(text)
    text.gsub(/[^\x00-\x7F]|["'<>&]/) do |ch|
      ent = $char_to_entity[ch]
      ent ? "&#{ent};" : sprintf("&#x%02X;", ch.unpack("U")[0])
    end
  end

  VIM::Buffer.current.line = encode(@str)
  #VIM::Buffer.current.line=CGI.escapeHTML(@str)
  #VIM::Buffer.current.line=@str.unpack("U*").collect {|s| (s > 127 ? "&##{s};" : s.chr) }.join("")
EOF
endfunction
map ,h :call HTMLEncode()<CR>

" insert image into html
function! InsertImageIntoHTML()
ruby << EOF

EOF
endfunction
:command! InsertImageIntoHTML :call InsertImageIntoHTML()

augroup avioli
  " Clear all autocmds in the group
  autocmd!

  autocmd! BufRead,BufNewFile *.ctp setfiletype php
  autocmd FileType html,php :imap <C-S-W> <Esc>bi<<Esc>ea><Esc>v%y%p%a/<Esc>hi
augroup END

" for vim-textobj-rubyblock
runtime macros/matchit.vim
