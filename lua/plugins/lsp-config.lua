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
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig() -- Asegurarse de llamar a extend_lspconfig aquí
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "cssls", "html", "ts_ls", "eslint", "tailwindcss" },
      })
      lspconfig.volar.setup({
        on_attach = require('lsp-format').on_attach,
        filetypes = { "vue" },
        init_options = {
          typescript = {
            serverPath = "/home/ferdev/.nvm/versions/node/v22.12.0/bin/tsserver",
          },
        },
      })
      lspconfig.tailwindcss.setup({})
      lspconfig.lua_ls.setup({ on_attach = require('lsp-format').on_attach })
      lspconfig.cssls.setup({ on_attach = require('lsp-format').on_attach })
      lspconfig.html.setup({ on_attach = require('lsp-format').on_attach })
      lspconfig.eslint.setup({ on_attach = require('lsp-format').on_attach })
      --
      lspconfig.ts_ls.setup({
        on_attach = require('lsp-format').on_attach,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/home/ferdev/.nvm/versions/node/v22.12.0/lib/node_modules/@vue/typescript-plugin",
              languages = { "vue", "typescript", "javascript" },
            },
          },
        },
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      })
    end,
    keys = {
      { "K",          vim.lsp.buf.hover,       desc = "Lsp hover" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code action" },
      { "LL",         ":LspRestart <CR>",      desc = "Restart lsp" },
      { "gd",         vim.lsp.buf.definition,  desc = "Go definition" },
    },
    vim.diagnostic.config {
      float = { border = "rounded" }
    },
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_prev()
    end, { noremap = true, silent = true }),
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_next()
    end, { noremap = true, silent = true }),
    vim.keymap.set("n", "D", function()
      vim.diagnostic.open_float()
    end, { noremap = true, silent = true })
  },
  { "neovim/nvim-lspconfig", lazy = false }
}
