local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then
    vim.notify("Unable to load lazy plugin manager")
    return
end

lazy.setup(
    "gnarlyquack.plugins",
    {
        ui = {
            -- replacement icons in lieu of Nerd Font
            icons = {
                cmd = "⌘",
                config = "🛠",
                event = "📅",
                ft = "📂",
                init = "⚙",
                keys = "🗝",
                plugin = "🔌",
                runtime = "💻",
                require = "🌙",
                source = "📄",
                start = "🚀",
                task = "📌",
                lazy = "💤 ",
            },
        },
        checker = {
            enabled = true,
            notify = true,
            frequency = 86400, -- check for updates every day
        },
        change_detection = {
            enabled = true,
            notify = false,
        },
    }
)
