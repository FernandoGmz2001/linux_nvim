return {
  "Bekaboo/dropbar.nvim",
  lazy = true,
  enabled = false,
  config = function()
    require("lazy").setup({})
  end,
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
}
