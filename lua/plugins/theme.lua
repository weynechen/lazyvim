return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    enabled = vim.g.lazyvim_colorscheme == "vscode",
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
        -- Disable spell check highlights
        SpellBad = { fg = "NONE", bg = "NONE", sp = "NONE", underline = false },
        SpellCap = { fg = "NONE", bg = "NONE", sp = "NONE", underline = false },
        SpellRare = { fg = "NONE", bg = "NONE", sp = "NONE", underline = false },
        SpellLocal = { fg = "NONE", bg = "NONE", sp = "NONE", underline = false },
      }
      require("vscode").setup(opts)
      require("vscode").load()
      vim.api.nvim_set_hl(0, "SnacksExplorerSelected", { bg = "#007ACC", fg = "#FFFFFF", bold = true })
      vim.api.nvim_set_hl(0, "SnacksExplorerCursorLine", { bg = "#282A36" })
      vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { fg = "#FFFFFF", bold = true })
      -- Flash.nvim colors with high contrast
      vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#FF007C", fg = "#000000", bold = true })
      vim.api.nvim_set_hl(0, "FlashMatch", { bg = "#3E68D7", fg = "#FFFFFF" })
      vim.api.nvim_set_hl(0, "FlashCurrent", { bg = "#FF9E64", fg = "#000000" })
      vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = "#545C7E" })
    end,
  },
  {
    "ydkulks/cursor-dark.nvim",
    lazy = false,
    priority = 1000,
    enabled = vim.g.lazyvim_colorscheme == "cursor-dark",
    config = function()
      vim.cmd.colorscheme("cursor-dark")
    end,
  },
}
