--  leader keys
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' ' -- set leader key for global plugins
vim.g.maplocalleader = ' ' -- set leader key for plugins local to a buffer

-- background
vim.opt.background = "dark" -- set dark background

-- buffers
vim.opt.autowrite = true -- automatically save buffers
vim.opt.hidden = true -- hide abandoned buffers (instead of unloading them)

-- highlighting
vim.opt.hlsearch = false -- only highlight searches when entering the search pattern
--vim.opt.hlsearch = true -- highlight searched terms
--vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- to clear highlights (in normal mode)
--vim.keymap.set('n', '<CR>', '<cmd>nohlsearch<CR>') -- to clear highlights in normal mode

-- line numbers
vim.opt.number = true         -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers

-- line wrapping
vim.opt.linebreak = true -- wrap long lines at word "edges"
vim.opt.showbreak = '↪' -- visually mark wrapped lines
vim.opt.breakindent = true -- indent wrapped lines to the current line's indent...
vim.opt.breakindentopt = "shift:3" -- ... plus one indent
-- using a table for breakindentopt is busted: https://github.com/neovim/neovim/issues/18875
--vim.opt.breakindentopt = { shift = 3 } -- ... plus one indent

-- mouse
vim.opt.mouse = 'a' -- enable mouse support (in 'a'll modes)

-- scrolling
vim.opt.cursorline = true -- show which line your cursor is on
vim.opt.scrolloff = 10 -- number of lines to keep above and below cursor

-- tabs
vim.opt.tabstop = 8 -- width of literal tab characters
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 4 -- width of autoindenting ('<<' and '>>')
vim.opt.softtabstop = 4 -- width of <Tab> and <BS>
vim.opt.smarttab = true -- use shiftwidth at the start of a line

-- terminal colors
vim.opt.termguicolors = true -- enable 24-bit colors in the terminal

-- whitespace
vim.opt.list = true -- show whitespace, with specific characters configured below
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', extends = '⇒', precedes = '⇐' }
vim.api.nvim_create_autocmd( -- trim extraneous whitespacs on save
    {"BufWritePre"},
    {
        pattern = {'*'},
        callback = function()
            -- save current view of window
            local view = vim.fn.winsaveview()
            vim.cmd([[
                " trim whitespace at end of file
                keeppatterns %s/\($\n\s*\)\+\%$//e
                " trim whitespace at start of file
                keeppatterns %s/\%^\(\s*\n\)\+//e
                " trim whitespace at end of lines
                keeppatterns %s/\s\+$//e
            ]])
            -- restore cursor to the saved view
            vim.fn.winrestview(view)
        end,
    }
)

-- lsp
vim.lsp.set_log_level("off")

-- netrw
 vim.g.netrw_liststyle = 3 -- use tree for directory listings
