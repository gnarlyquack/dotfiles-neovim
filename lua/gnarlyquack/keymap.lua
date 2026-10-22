-- in normal and visual modes, remap 'j' and 'k' to move up and down visual
-- (i.e., wrapped) lines
vim.keymap.set({"n", "v"}, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set({"n", "v"}, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- when paging, center the cursor on the screen
vim.keymap.set("", "<C-d>", "<C-d>zz")
vim.keymap.set("", "<C-u>", "<C-u>zz")

-- when searching next and previous, center the cursor to screen ('zz') and
-- open folds as necessary ('zv') to make cursor visible
--vim.keymap.set({"n", "v"}, "n", "nzzzv")
--vim.keymap.set({"n", "v"}, "N", "Nzzzv")
