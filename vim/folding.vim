" Folding settings shared between vim and neovim (see vim/settings.vim).
" This must be sourced before `syntax enable` (see settings.vim): opening a
" file from the command line triggers filetype detection right when
" `syntax enable` runs, so g:markdown_folding and the foldmethod default
" below both need to already be in place by then, or markdown folding
" (za/zM on headings) silently doesn't work.
let g:markdown_folding = 1
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
set foldcolumn=2
" Other acceptable values are marker, manual, expr, syntax, diff

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_folding
    autocmd!
    autocmd FileType python setlocal foldmethod=indent
augroup END

