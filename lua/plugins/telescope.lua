return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  keys = {
    { ";f", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { ";r", "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
    { ";b", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
    {
      "sf",
      function()
        local telescope = require("telescope")
        local fb_actions = telescope.extensions.file_browser.actions
        local function telescope_buffer_dir()
          return vim.fn.expand("%:p:h")
        end
        telescope.extensions.file_browser.file_browser({
          winblend = 15,
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
            vertical = { width = 0.5 },
            -- height = 40,
          },
          mappings = {
            ["n"] = {
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
            }
          }
        })
      end,
      desc = "Open File Browser with the path of the current buffer",
    },
  },
  opts = {
    pickers = {
      find_files = {
        theme = "ivy",
        winblend = 15,
        mappings = {
          i = {
            ["<esc>"] = require('telescope.actions').close,
          },
          n = {
            ["q"] = require('telescope.actions').close,
            ["<esc>"] = require('telescope.actions').close,
          },
        },
      },
      live_grep = {
        theme = "ivy",
        winblend = 15,
      },
      file_browser = {
        winblend = 15,
        --    mappings = {
        -- 	-- your custom insert mode mappings
        -- 	["n"] = {
        -- 		-- your custom normal mode mappings
        -- 		["N"] = require('telescope').extensions.file_browser.file_browser.actions.create,
        -- 		["h"] = require('telescope').extensions.file_browser.file_browser.actions.goto_parent_dir,
        -- 		["/"] = function()
        -- 			vim.cmd("startinsert")
        -- 		end,
        -- 	},
        -- },
      },
      buffers = {
        theme = "ivy",
        sort_mru = true,
        initial_mode = "normal",
        ignore_current_buffer = true,
        mappings = {
          i = {
            ["<C-w>"] = "delete_buffer",
          },
          n = {
            ["dd"] = "delete_buffer",
            ["q"] = require('telescope.actions').close,
            ["<esc>"] = require('telescope.actions').close,
          },
        },
      },
    },
  },
}
