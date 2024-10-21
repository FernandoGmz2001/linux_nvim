return {
    {
        "VonHeikemen/lsp-zero.nvim",
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig() -- Asegurarse de llamar a extend_lspconfig aquí
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)
            lsp_zero.setup()
        end,
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end, -- opts = {
        --     ensure_installed = {
        --     }
        -- }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local lspconfig = require("lspconfig")
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig() -- Asegurarse de llamar a extend_lspconfig aquí
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "tailwindcss" },
            })
            lspconfig.volar.setup({})
            lspconfig.tailwindcss.setup({})
            lspconfig.lua_ls.setup(require("lsp-zero").nvim_lua_ls())
            -- lspconfig.css.setup({})
            -- lspconfig.html.setup({})
            -- lspconfig.eslint.setup({})

            -- Configuración adicional para tsserver
            lspconfig.ts_ls.setup({})

            -- You must make sure volar is setup
            -- e.g. require'lspconfig'.volar.setup{}
            -- See volar's section for more information      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "folke/noice.nvim",
        enabled = true,
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "MunifTanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
                name = "notify",
                opts = {
                    presets = {
                        lsp_doc_border = true,
                    },
                    top_down = false,
                    stages = "static",
                    max_height = function()
                        return math.floor(vim.o.lines * 0.75)
                    end,
                    max_width = function()
                        return math.floor(vim.o.columns * 0.75)
                    end,
                },
            },
        },
        config = function()
            require("noice").setup({
                lsp = {
                    signature = {
                        enabled = false,
                    },
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                        ["vim.lsp.util.stylize_markdown"] = false,
                        ["cmp.entry.get_documentation"] = false,
                    },
                },
                messages = {
                    view = "mini",
                    view_warn = "mini",
                },
                presets = {
                    bottom_search = false,
                    command_palette = true,
                    long_message_to_split = true,
                    inc_rename = true,
                    lsp_doc_border = true,
                },
                routes = {
                    { filter = { event = "notify", find = "No information available" }, opts = { skip = true } },
                },
            })
            vim.opt.lazyredraw = false
        end,
    },
}
