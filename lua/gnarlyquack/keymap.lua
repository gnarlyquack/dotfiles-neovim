-- in normal and visual modes, remap 'j' and 'k' to move up and down visual
-- (i.e., wrapped) lines
vim.keymap.set({"n", "v"}, "j", "gj", { noremap = true })
vim.keymap.set({"n", "v"}, "k", "gk", { noremap = true })

-- when paging, center the cursor on the screen
vim.keymap.set("", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("", "<C-u>", "<C-u>zz", { noremap = true })

-- when searching next and previous, center the cursor to screen ('zz') and
-- open folds as necessary ('zv') to make cursor visible
vim.keymap.set({"n", "v"}, "n", "nzzzv", { noremap = true })
vim.keymap.set({"n", "v"}, "N", "Nzzzv", { noremap = true })
