" Folding settings shared between vim and neovim (see vim/settings.vim).
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
set foldcolumn=2
" Other acceptable values are marker, manual, expr, syntax, diff

" File type specific  
let g:markdown_folding = 1

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_folding
    autocmd!
    autocmd FileType python setlocal foldmethod=indent
augroup END

