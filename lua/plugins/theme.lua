return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "dark",
      transparent = false,
      italic_comments = true,
      italic_inlayhints = true,
      underline_links = true,
      terminal_colors = true,
    },
    config = function(_, opts)
      local c = require('vscode.colors').get_colors()
      opts.color_overrides = {
        vscLineNumber = '#858585',
        vscCursorLine = '#282A36',
      }
      opts.group_overrides = {
        CursorLine = { bg = c.vscCursorLine },
        CursorLineNr = { fg = c.vscWhite, bold = true },
        Visual = { bg = c.vscDarkBlue },
        Search = { bg = c.vscDarkYellow, fg = c.vscNone },
        IncSearch = { bg = c.vscDarkCyan, fg = c.vscNone },
        NormalFloat = { bg = c.vscToolTipBg },
        Pmenu = { bg = c.vscToolTipBg },
        PmenuSel = { bg = c.vscDarkBlue, fg = c.vscWhite, bold = true },
     }
      require("vscode").setup(opts)
      require("vscode").load()
      vim.api.nvim_set_hl(0, "SnacksExplorerSelected", { bg = "#007ACC", fg = "#FFFFFF", bold = true })
      vim.api.nvim_set_hl(0, "SnacksExplorerCursorLine", { bg = "#282A36" })
      vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { fg = "#FFFFFF", bold = true })
    end,
  },
  -- {
  --   "ydkulks/cursor-dark.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("cursor-dark")
  --   end,
  -- },
}
