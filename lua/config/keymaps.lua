local opts = { noremap = true, silent = true }
local keymap = vim.keymap

vim.keymap.set("n", ";z", ":ZenMode <CR>")
keymap.set("n", "WW", vim.cmd.write)
keymap.set("n", "QQ", ":wqa<Return>")
keymap.set("n", "<leader>q", ":bd<Return>")
keymap.set("n", "<esc>", ":noh<CR>")
keymap.set('n', '<C-a>', "gg<S-v>G")
keymap.set('n', 'ss', ':split<Return>', opts)
keymap.set('n', 'sv', ':vsplit<Return>', opts)

--Keymap for delete with ctrl + backspace
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', { noremap = true })
