 return {
        "folke/todo-comments.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup({})
            vim.keymap.set("n", ";t", ":TodoTelescope<CR>")
        end,
}
