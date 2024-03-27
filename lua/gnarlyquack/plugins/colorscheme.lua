return {
    {
        "thallada/farout.nvim",
        --"fcpg/vim-farout",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "farout"
        end,
    },
    {
        "kvrohit/substrata.nvim",
        event = "VeryLazy",
        --[[
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "base16-grayscale-dark"
        end,
        --]]
    },
    {
        "tinted-theming/base16-vim",
        event = "VeryLazy",
        --[[
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "base16-grayscale-dark"
        end,
        --]]
    },
    {
        "cocopon/iceberg.vim",
        event = "VeryLazy",
        --[[
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "iceberg"
        end,
        --]]
    },
}
