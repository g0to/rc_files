" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available on Debian.
runtime! debian.vim

syntax on           " syntax highlighting

"set hlsearch       " higlight search matches
"set nowrap         " lines will not wrap
"set textwidth=80   " maximum width of text that is being inserted. A longer line will be broken after white space
set autoindent      " copy indent from current line when starting a new line
set bs=2            " allow backspacing
set clipboard=unnamed    " share clipboard with macOS
set encoding=utf-8
set expandtab       " use the appropriate number of spaces to insert a <Tab>
set ignorecase      " ignore case in search patterns
set incsearch       " when searching, show results that match what's typed so far
set laststatus=2    " when the last window will have a status line (2 always)
set scrolloff=3     " show context above/below cursorline
set shiftwidth=4    " number of spaces to use for each step of (auto)indent. Used for '>>' and '<<'
set showcmd         " show (partial) command in the last line of the screen
set smartcase       " override the 'ignorecase' option if the search pattern contains upper case characters
set smartindent     " do smart autoindenting when starting a new line
set smarttab        " when on, a <Tab> at the beginning of a line inserts blanks according to 'shiftwidth'
set tabstop=4       " number of spaces that a <Tab> in the file counts for
set whichwrap+=<,>  " this will make left and right wrap around line endings

" custom status line
"%t     tail of the filename
"%h     help file flag
"%m     modified flag
"%r     read only flag
"%=     left/right separator
"%c,    cursor column
"%l/%L  cursor line/total lines
"%P     percent through file
hi StatusLine cterm=none ctermfg=black
hi StatusLineNC cterm=none ctermbg=darkgray ctermfg=black
hi User1 ctermbg=darkgrey  ctermfg=black
hi User2 ctermbg=darkgrey  ctermfg=white
:set statusline=%1*%t%2*%h%m%r%=%1*%l,%c\ /\ %L\ \ %P

" A-W-E-S-O-M-E selection navigation
"set selectmode=key      " start select mode when using shifted special keys (cursor keys, <End>, <Home>, <PageUp> and <PageDown>)
"set selection=exclusive " means that the last character of the selection is included in an operation
"set keymodel=startsel,stopsel " shifted special key starts selection. not-shifted special key stops selection
"set whichwrap=<,>,[,]   " allows wrap only when cursor keys are used

" key remapings
map a i
map oo o<Esc>
map <F2> @:
"map <F2> :s/.*/\r-------\r/<Enter>
"map <F3> :Supersplit<CR>
map <F3> :s/.*/\r\*\*Nota\*\*\r/ \| -1,/^-------/-2s/.*/\> &/<Enter>

" custom commands
" gnulinux_sysadmin customs
command! -bar Start1 :g/FUOC •/d
command! -bar Start2 :%s/\n\{3,\}/\r\r/g
command! -bar Start3 :g/^\d\.\s/s/^\d\.\s// | Surroundline ##
command! -bar Start4 :g/^\(\d\.\)\{2\}\s/s/^\(\d\.\)\{2\}\s// | Surroundline ###
command! -bar Start5 :g/^\(\d\.\)\{3\}\s/s/^\(\d\.\)\{3\}\s// | Surroundline ####
command! -bar Start6 :%s/^•\s//
command! -bar Superstart :Start1 | Start2 | Start3 | Start4 | Start5 | Start6
command! -bar Splitpar :mark a | ,/^$/s/-\n//e | 'a | ,/^$/-2s/\n/ /
command! -bar Untab :mark a | ,/^$/s/^\s\{4,\}//e | 'a
command! -bar Supersplit :Untab | Splitpar
command! -bar -nargs=1 Surroundline :s/.\+/<args> & <args>/
command! -bar -nargs=1 Surroundword :execute 's/' . expand("<cWORD>") . '/<args>&<args>/'
command! -bar Killnote1 :,$s/\s\{3,\}.\+$//c
command! -bar Killnote2 :,$s/.\+\s\{3,\}\(.\+\)/\1/c
command! -bar Dashit :s/.\+/-   &/
command! -bar Importante :s/.*/\r> **Importante**\r>/
command! -bar Greatthan :s/.*/> &/

autocmd BufWritePre * %s/\s\+$//e   " Automatically removes all trailing whitespaces on save

