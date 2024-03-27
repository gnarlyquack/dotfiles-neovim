cnoremap <silent><expr> <enter> index(['/', '?'], getcmdtype()) >= 0 ? '<enter>zz' : '<enter>'

"highlight trailing whitespace
match Error /\s\+$/

"remove trailing whitespace and blank lines
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\($\n\s*\)\+\%$//e
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
