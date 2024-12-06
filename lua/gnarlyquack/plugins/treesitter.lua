return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "comment", -- comment tags
                "cpp",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "lua",
                "make",
                "python",
                "rust",
                "sql",
                "toml",
                "vim",
                "vimdoc", -- vim documentation
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter
                -- at the same time. Set this to `true` if you depend on
                -- 'syntax' being enabled (like for indentation). Using this
                -- option may slow down your editor, and you may see some
                -- duplicate highlights. Instead of true it can also be a
                -- list of languages
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
