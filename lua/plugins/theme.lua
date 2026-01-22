return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "dark",
      transparent = false,
      italic_comments = true, -- Apply theme colors to terminal
      terminal_colors = true,
    },
    config = function(_, opts)
      require("vscode").setup(opts)
      require("vscode").load()
    end,
  },
  {
    "ydkulks/cursor-dark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("cursor-dark")
    end,
  },
}
