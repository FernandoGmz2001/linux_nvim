return {
  {
    "rmanocha/linear-nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("linear-nvim").setup()
      vim.keymap.set("n", "<leader>mm", function()
        require("linear-nvim").show_assigned_issues()
      end)
      vim.keymap.set("v", "<leader>mc", function()
        require("linear-nvim").create_issue()
      end)
      vim.keymap.set("n", "<leader>mc", function()
        require("linear-nvim").create_issue()
      end)
      vim.keymap.set("n", "<leader>ms", function()
        require("linear-nvim").show_issue_details()
      end)
    end,
  },
}
