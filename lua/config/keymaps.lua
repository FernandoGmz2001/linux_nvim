-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.list = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.cursorline = true

vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>AdvancedNewFile<CR>", opts)

vim.opt.foldcolumn = "0" -- No muestra la columna de plegado.
vim.opt.foldlevel = 99 -- Establece el nivel de plegado a 99 para que todos los pliegues estén abiertos por defecto.
vim.opt.foldlevelstart = 99 -- Establece el nivel de plegado inicial a 99.
vim.opt.foldenable = true

vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=2")
vim.opt.guicursor = {
  "n-v-c:block", -- Normal, visual, command-line: block cursor
  "i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  "r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
  "o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
  "a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}
-- vim.keymap.set("n", "<c-/>", lazyterm, { desc = "Terminal (Root Dir)" })
vim.keymap.set("n", "te", ":tabedit<CR>", opts)
vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious)

vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set("n", "<leader>q", ":bd<CR>")
vim.keymap.set("n", "<leader>m", ":Mason<CR>")
vim.keymap.set("n", "<leader>h", ":noh<CR>")
-- vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })
vim.keymap.set("n", "<C-a>", "gg<S-v>G")
-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)
vim.api.nvim_set_keymap("i", "<C-H>", "<C-W>", { noremap = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
-- Diagnostics
vim.keymap.set("n", "[d", function()
  vim.diagnostic.goto_prev()
end, opts)
vim.keymap.set("n", "]d", function()
  vim.diagnostic.goto_next()
end, opts)
