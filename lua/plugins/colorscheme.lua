return {
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      -- vim.cmd("colorscheme onedark_vivid")
    end
  },
  {
    'marko-cerovac/material.nvim',
    config = function()
      -- vim.cmd("colorscheme material")
    end
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      -- vim.cmd("colorscheme kanagawa")
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin")
    end
  }
}
