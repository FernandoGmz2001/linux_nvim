return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true, -- Auto close tags
                    enable_rename = true, -- Auto rename pairs of tags
                    enable_close_on_slash = false, -- Auto close on trailing </
                },
                per_filetype = {
                    ["html"] = {
                        enable_close = true,
                    },
                    ["jsx"] = {
                        enable_close = true,
                    },
                    ["tsx"] = {
                        enable_close = true,
                    },
                },
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.diagnostics.erb_lint,
                    null_ls.builtins.diagnostics.rubocop,
                    null_ls.builtins.formatting.rubocop,
                },
            })

            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end,
    },
    { "folke/flash.nvim", enabled = false },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {"nvimdev/lspsaga.nvim"}
}
