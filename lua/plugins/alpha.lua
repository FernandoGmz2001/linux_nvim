return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "RchrdAriza/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local startify = require("alpha.themes.startify")

    local time = os.date("%H:%M")
    local date = os.date("%a %d %b")

    -- Set header
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                            ███████╗███████╗██████╗ ██████╗ ███████╗██╗   ██╗                            ]],
      [[                            ██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝██║   ██║                            ]],
      [[                            █████╗  █████╗  ██████╔╝██║  ██║█████╗  ██║   ██║                            ]],
      [[                            ██╔══╝  ██╔══╝  ██╔══██╗██║  ██║██╔══╝  ╚██╗ ██╔╝                            ]],
      [[                            ██║     ███████╗██║  ██║██████╔╝███████╗ ╚████╔╝                             ]],
      [[                            ╚═╝     ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝  ╚═══╝                              ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "󰮗   Find file", ":cd $HOME | Telescope find_files<CR>"),
      dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("c", "   Configuration", ":cd ~/.config/nvim | e init.lua<CR>"),
      dashboard.button("R", "󱘞   Ripgrep", ":Telescope live_grep<CR>"),
      dashboard.button("q", "󰗼   Quit", ":qa<CR>"),
    }

    function centerText(text, width)
      local totalPadding = width - #text
      local leftPadding = math.floor(totalPadding / 2)
      local rightPadding = totalPadding - leftPadding
      return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
    end

    dashboard.section.footer.val = {
      centerText("Fernando Gomez", 50),
      " ",
      centerText(date, 50),
      centerText(time, 50),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
