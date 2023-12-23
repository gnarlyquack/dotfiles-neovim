set mouse=a
set termguicolors
set background = "dark"

" Change highlighting of cursor line when entering/leaving Insert Mode
" highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
" autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
" autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

set autowriteall " save files when switching buffers
"set cursorline " highlight the line on which the cursor is located
set hidden " hide existing buffer (instead of unloading it) when opening a new file
set nohlsearch " only highlight searches when entering the search pattern

cnoremap <silent><expr> <enter> index(['/', '?'], getcmdtype()) >= 0 ? '<enter>zz' : '<enter>'

"
" line wrapping
"
" wrap long lines at word "edges"
set linebreak
" visually mark wrapped lines
set showbreak=↪
" indent wrapped lines to match the current line's indenting (plus one)
set breakindent
set breakindentopt=shift:3

"
"tabs
"
" use 8 spaces to display literal tab characters
set tabstop=8
" when indenting, shift left or right by 4 spaces
" shiftwidth is used for autoindenting, e.g., cindent, <<, and >>
" softtabstop is used when pressing the tab key, etc.
set shiftwidth=4 softtabstop=4
" when indenting, use spaces instead of tab characters
set expandtab
" at the beginning of a line, use shiftwidth (instead of tabstop or
" softtabstop) for the number of spaces to indent
set smarttab

"show characters we wouldn't normally expect
set listchars=tab:»\ ,trail:·,extends:⇒,precedes:⇐,nbsp:·
set list

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
