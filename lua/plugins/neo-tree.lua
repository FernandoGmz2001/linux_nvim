return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = true,
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree filesystem reveal toggle float<cr>", desc = "NeoTree" },
  },
  opts = {
    view = { adaptive_size = true },
    window = {
      position = "left",
      -- width = 32
    }
  }
}
