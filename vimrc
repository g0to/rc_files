" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

syntax on           " syntax highlighting
set autoindent      " copy indent from current line when starting a new line
set smartindent     " do smart autoindenting when starting a new line
set shiftwidth=4    " number of spaces to use for each step of (auto)indent. Used for '>>' and '<<'
set smarttab        " when on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'
set tabstop=4       " number of spaces that a <Tab> in the file counts for
set expandtab       " use the appropriate number of spaces to insert a <Tab>
set ignorecase      " ignore case in search patterns
set smartcase       " override the 'ignorecase' option if the search pattern contains upper case characters
set laststatus=2    " when the last window will have a status line (2 always)
set showcmd         " show (partial) command in the last line of the screen
set textwidth=80    " maximum width of text that is being inserted. A longer line will be broken after white space
set nowrap          " lines will not wrap 

" A-W-E-S-O-M-E selection navigation
set selectmode=key      " start select mode when using shifted special keys (cursor keys, <End>, <Home>, <PageUp> and <PageDown>)
set selection=exclusive " means that the last character of the selection is included in an operation
set keymodel=startsel,stopsel " shifted special key starts selection. not-shifted special key stops selection
set whichwrap=<,>,[,]   " allows wrap only when cursor keys are used

" key remapings
map <C-x> d
