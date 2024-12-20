return {
  "folke/zen-mode.nvim",
  opts = {
    window  = {
      backdrop = 0.30,
      width = 300,
    },
    plugins = {
      options = {
        laststatus = 0
      },
    }
  },
  keys = { "<leader>z", ":ZenMode <CR>", desc = "ZenMode" },
}
