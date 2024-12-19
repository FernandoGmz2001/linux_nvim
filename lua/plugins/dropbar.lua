return {
  "Bekaboo/dropbar.nvim",
  lazy = false,
  enabled = false,
  config = function()
    require("lazy").setup({})
  end,
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
}
