return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },

    config = function()
        --
        -- mason
        --
        local ok, mason = pcall(require, "mason")
        if not ok then
            vim.notify("Unable to load mason")
            return
        end

        mason.setup({
            ui = {
                -- in lieu of installing a Nerd Font
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        --
        -- mason-lspconfig
        --
        local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
        if not ok then
            vim.notify("Unable to load mason-lspconfig")
            return
        end

        mason_lspconfig.setup {
            -- automatically install servers configured in lspconfig
            automatic_installation = true,
        }

        --
        -- nvim-lspconfig
        --
        local ok, lspconfig = pcall(require, "lspconfig")
        if not ok then
            vim.notify("Unable to load lspconfig")
            return
        end

        vim.diagnostic.config {
            virtual_text = false,
            float = {
                scope = 'cursor',
                source = 'always',
                prefix = ' ',
                focusable = false,
                border = 'rounded',
                --close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            },
        }

        vim.opt.signcolumn = "yes"

        local on_attach = function(client, bufnr)
            -- format on save
            vim.api.nvim_create_autocmd("BufWrite", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
            -- show diagnostic as a popup
            --[[
            vim.api.nvim_create_autocmd("CursorHold", {
                buffer = bufnr,
                callback = function()
                    local opts = {
                        focusable = false,
                        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                        border = 'rounded',
                        source = 'always',
                        prefix = ' ',
                        scope = 'cursor',
                    }
                    vim.diagnostic.open_float(nil, opts)
                end,
            })
            --]]

            local keymap = vim.keymap
            local opts = { buffer = bufnr, noremap = true, silent = true }

            opts.desc = "Show diagnostic"
            keymap.set("n", "<leader>ds", vim.diagnostic.open_float, opts)

            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

            opts.desc = "Show LSP type definitions"
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "Smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end

        lspconfig.clangd.setup {
            on_attach = on_attach,
        }

        lspconfig.cmake.setup {
            on_attach = on_attach,
        }

        lspconfig.lua_ls.setup {
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        }

        --[[
        lspconfig.sqlls.setup {
            on_attach = on_attach,
            root_dir = function() return vim.loop.cwd() end,
        }
        --]]
    end,
}
