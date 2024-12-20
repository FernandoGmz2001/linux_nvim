return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = function()
    local custom_catppuccin = require('lualine.themes.catppuccin')
    custom_catppuccin.normal.c.bg = 'None'

    require('lualine').setup {
      options = {
        theme = custom_catppuccin,
        globalstatus = true,
      },
    }
  end,
}
