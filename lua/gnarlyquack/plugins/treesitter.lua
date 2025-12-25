return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        parsers = {
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
        }

        ts.install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = parsers,
            callback = function()
                vim.treesitter.start()
            end
        })
    end,
}
