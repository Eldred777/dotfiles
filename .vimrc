syntax enable " enable syntax highlighting

" Spaces and tabs
set tabstop=4     " visual spaces per <TAB>
set softtabstop=4 " number of spaces in tab when editing
set expandtab     " tabs are spaces

" ui config
set number         " show line numbers
set showcmd        " show cmd in bottom bar 
set cursorline     " highlight curr line
filetype indent on " load filetype-specific indent files 

" searching
set incsearch      " search as characters typed
set hlsearch " highlight matches

"folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent 
" Other acceptable values are marker, manual, expr, syntax, diff

