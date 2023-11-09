return {
    "nvim-treesitter/nvim-treesitter",

    build = function()
        local ok, install = pcall(require, "nvim-treesitter.install")
        if not ok then
            vim.notify("Unable to load nvim-treesitter.install")
            return
        end

       install.update({ with_sync = true })()
    end,

    config = function ()
        local ok, configs = pcall(require, "nvim-treesitter.configs")
        if not ok then
            vim.notify("Unable to load nvim-tresitter.configs")
            return
        end

        configs.setup({
            ensure_installed = {
                "c", "cpp",
                "cmake",
                "comment", -- comment tags
                "lua",
                "python",
                "sql",
                "vimdoc", -- vim documentation
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at
                -- the same time. Set this to `true` if you depend on 'syntax'
                -- being enabled (like for indentation). Using this option may
                -- slow down your editor, and you may see some duplicate
                -- highlights. Instead of true it can also be a list of
                -- languages
                additional_vim_regex_highlighting = false,
            },
            --indent = { enable = true },
        })
    end
}
